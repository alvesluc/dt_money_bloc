import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dt_money/shared/services/local_storage_service.dart';
import 'package:dt_money/src/home/transactions/models/new_transaction.dart';
import 'package:dt_money/src/home/transactions/models/transaction.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:uuid/uuid.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

EventTransformer<E> _restartableDebounce<E>() {
  return (events, mapper) {
    return restartable<E>()(
      events.debounce(const Duration(milliseconds: 350)),
      mapper,
    );
  };
}

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc(this._localStorage) : super(const TransactionsState()) {
    on(_fetchTransactions);
    on(_onAddTransaction);
    on<TransactionsSearched>(
      _onSearchTermChanged,
      transformer: _restartableDebounce(),
    );
  }

  final LocalStorageService _localStorage;

  Future<void> _fetchTransactions(
    TransactionsFetched event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      final transactions = await _localStorage.getTransactions();
      emit(
        state.copyWith(
          transactions: transactions,
          status: TransactionsStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }

  Future<void> _onAddTransaction(
    TransactionAdded event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      final transaction = Transaction(
        id: const Uuid().v1(),
        createdAt: DateTime.now(),
        description: event.newTransaction.description,
        value: event.newTransaction.value,
        category: event.newTransaction.category,
        type: event.newTransaction.type,
      );

      await _localStorage.addTransaction(transaction);

      emit(
        state.copyWith(
          transactions: [...?state.transactions, transaction],
          status: TransactionsStatus.success,
        ),
      );
    } catch (e, st) {
      print(e);
      print(st);
      emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }

  Future<void> _onSearchTermChanged(
    TransactionsSearched event,
    Emitter<TransactionsState> emit,
  ) async {
    try {} catch (e) {
      emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }
}
