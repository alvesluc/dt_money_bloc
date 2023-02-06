import 'package:bloc_test/bloc_test.dart';
import 'package:dt_money/shared/services/local_storage_service.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/home/transactions/models/transaction.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

void main() {
  final mockTransactions = [
    Transaction(
      id: '',
      createdAt: DateTime.now(),
      description: '',
      value: 0,
      category: '',
      type: TransactionType.income,
    ),
  ];

  final extraTransactions = [
    Transaction(
      id: '',
      createdAt: DateTime.now(),
      description: '',
      value: 0,
      category: '',
      type: TransactionType.income,
    ),
  ];

  late MockLocalStorageService localStorage;

  group('TransactionsBloc', () {
    setUp(() {
      localStorage = MockLocalStorageService();
    });

    test('initial state is TransactionsState', () {
      expect(TransactionsBloc(localStorage).state, const TransactionsState());
    });

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
    });
  });
}
