import 'package:bloc_test/bloc_test.dart';
import 'package:dt_money/shared/services/local_storage_service.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/home/transactions/models/new_transaction.dart';
import 'package:dt_money/src/home/transactions/models/transaction.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

void main() {
  DateTime _setDateWithoutTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  late MockLocalStorageService localStorage;

  group('TransactionsBloc', () {
    setUp(() {
      localStorage = MockLocalStorageService();
    });

    final mockTransactions = [
      Transaction(
        id: 1,
        createdAt: _setDateWithoutTime(),
        description: 'description',
        value: 10,
        category: 'category',
        type: TransactionType.income,
      ),
    ];

    final extraTransactions = [
      Transaction(
        id: 2,
        createdAt: _setDateWithoutTime(),
        description: 'extraDescription',
        value: 20,
        category: 'extraCategory',
        type: TransactionType.expense,
      ),
    ];

    test('initial state is TransactionsState', () {
      expect(TransactionsBloc(localStorage).state, const TransactionsState());
    });

    test('incrementTransactionId returns 1 when id is null', () {
      expect(TransactionsBloc(localStorage).incrementTransactionId(null), 1);
    });

    test('incrementTransactionId increments last id by 1', () {
      const lastId = 41;
      expect(
        TransactionsBloc(localStorage).incrementTransactionId(lastId),
        lastId + 1,
      );
    });

    test(
      'setDateWithoutTime returns current date only with year, month and day',
      () {
        final now = DateTime.now();
        expect(
          TransactionsBloc(localStorage).setDateWithoutTime(),
          DateTime(now.year, now.month, now.day),
        );
      },
    );

    group('TransactionsFetched', () {
      blocTest<TransactionsBloc, TransactionsState>(
        'emits successful status when TransactionsFetched is added.',
        setUp: () {
          when(() => localStorage.getTransactions()).thenAnswer((_) async {
            return mockTransactions;
          });
        },
        build: () => TransactionsBloc(localStorage),
        act: (bloc) => bloc.add(TransactionsFetched()),
        expect: () => <TransactionsState>[
          TransactionsState(
            status: TransactionsStatus.success,
            transactions: mockTransactions,
          )
        ],
        verify: (_) {
          verify(() => localStorage.getTransactions()).called(1);
        },
      );

      blocTest<TransactionsBloc, TransactionsState>(
        'emits failure status when TransactionsFetched and throw exception',
        setUp: () {
          when(() => localStorage.getTransactions()).thenAnswer((_) async {
            throw Exception();
          });
        },
        build: () => TransactionsBloc(localStorage),
        act: (bloc) => bloc.add(TransactionsFetched()),
        expect: () => <TransactionsState>[
          const TransactionsState(status: TransactionsStatus.failure)
        ],
        verify: (_) {
          verify(() => localStorage.getTransactions()).called(1);
        },
      );
    });

    group('TransactionAdded', () {
      const mockNewTransaction = NewTransaction(
        description: 'description',
        value: 10,
        category: 'category',
        type: TransactionType.income,
      );

      const mockExtraNewTransaction = NewTransaction(
        description: 'extraDescription',
        value: 20,
        category: 'extraCategory',
        type: TransactionType.expense,
      );

      setUpAll(() {
        registerFallbackValue(mockTransactions.first);
      });

      blocTest<TransactionsBloc, TransactionsState>(
        'emits success when TransactionAdded adds a new transaction',
        setUp: () {
          when(
            () => localStorage.addTransaction(any<Transaction>()),
          ).thenAnswer((_) => Future<void>.value());
        },
        build: () => TransactionsBloc(localStorage),
        act: (bloc) => bloc.add(const TransactionAdded(mockNewTransaction)),
        expect: () => <TransactionsState>[
          TransactionsState(
            status: TransactionsStatus.success,
            transactions: mockTransactions,
          ),
        ],
        verify: (_) {
          verify(
            () => localStorage.addTransaction(any<Transaction>()),
          ).called(1);
        },
      );

      blocTest<TransactionsBloc, TransactionsState>(
        'emits success when TransactionAdded adds a new transaction when '
        "transactions aren't empty",
        setUp: () {
          when(
            () => localStorage.addTransaction(any<Transaction>()),
          ).thenAnswer((_) => Future<void>.value());
        },
        build: () => TransactionsBloc(localStorage),
        seed: () => TransactionsState(
          status: TransactionsStatus.success,
          transactions: mockTransactions,
        ),
        act: (bloc) => bloc.add(
          const TransactionAdded(mockExtraNewTransaction),
        ),
        expect: () => <TransactionsState>[
          TransactionsState(
            status: TransactionsStatus.success,
            transactions: [...mockTransactions, ...extraTransactions],
          ),
        ],
        verify: (_) {
          verify(
            () => localStorage.addTransaction(any<Transaction>()),
          ).called(1);
        },
      );

      blocTest<TransactionsBloc, TransactionsState>(
        'emits failure when TransactionAdded throws an exception',
        setUp: () {
          when(
            () => localStorage.addTransaction(any<Transaction>()),
          ).thenAnswer((_) => throw Exception());
        },
        build: () => TransactionsBloc(localStorage),
        act: (bloc) => bloc.add(const TransactionAdded(mockNewTransaction)),
        expect: () => <TransactionsState>[
          const TransactionsState(status: TransactionsStatus.failure),
        ],
        verify: (_) {
          verify(
            () => localStorage.addTransaction(any<Transaction>()),
          ).called(1);
        },
      );
    });

    group('TransactionSearched', () {
      final extraTransactionsForSearching = [
        Transaction(
          id: 3,
          createdAt: _setDateWithoutTime(),
          description: 'forSearching',
          value: 30,
          category: 'forSearching',
          type: TransactionType.income,
        ),
      ];

      blocTest<TransactionsBloc, TransactionsState>(
        'emits success when TransactionsSearched finds matching',
        build: () => TransactionsBloc(localStorage),
        seed: () => TransactionsState(
          status: TransactionsStatus.success,
          transactions: [...mockTransactions, ...extraTransactions],
        ),
        act: (bloc) => bloc.add(const TransactionsSearched('income')),
        expect: () => <TransactionsState>[
          TransactionsState(
            status: TransactionsStatus.success,
            transactions: mockTransactions,
          ),
        ],
      );

      blocTest<TransactionsBloc, TransactionsState>(
        'emits success when TransactionsSearched finds no matching',
        build: () => TransactionsBloc(localStorage),
        seed: () => TransactionsState(
          status: TransactionsStatus.success,
          transactions: [...mockTransactions, ...extraTransactions],
        ),
        act: (bloc) => bloc.add(
          const TransactionsSearched('gibberish'),
        ),
        expect: () => <TransactionsState>[
          const TransactionsState(
            status: TransactionsStatus.success,
            transactions: [],
          ),
        ],
      );

      blocTest<TransactionsBloc, TransactionsState>(
        'emits success when TransactionsSearched finds multiple matching',
        build: () => TransactionsBloc(localStorage),
        seed: () => TransactionsState(
          status: TransactionsStatus.success,
          transactions: [
            ...mockTransactions,
            ...extraTransactions,
            ...extraTransactionsForSearching,
          ],
        ),
        act: (bloc) => bloc.add(
          const TransactionsSearched('description'),
        ),
        expect: () => <TransactionsState>[
          TransactionsState(
            status: TransactionsStatus.success,
            transactions: [...mockTransactions, ...extraTransactions],
          ),
        ],
      );

      blocTest<TransactionsBloc, TransactionsState>(
        'emits nothing if search is equal to previous state',
        build: () => TransactionsBloc(localStorage),
        seed: () => TransactionsState(
          status: TransactionsStatus.success,
          transactions: [...mockTransactions, ...extraTransactions],
        ),
        act: (bloc) => bloc.add(
          const TransactionsSearched('description'),
        ),
        expect: () => <Never>[],
      );
    });
  });
}
