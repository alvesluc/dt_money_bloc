import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dt_money/shared/services/local_storage_service.dart';
import 'package:dt_money/src/home/transactions/models/new_transaction.dart';
import 'package:dt_money/src/home/transactions/models/transaction.dart';
import 'package:dt_money/src/shared/extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:stream_transform/stream_transform.dart';

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
      return emit(
        state.copyWith(
          transactions: transactions,
          status: TransactionsStatus.success,
        ),
      );
    } catch (e) {
      return emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }

  Future<void> _onAddTransaction(
    TransactionAdded event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      final transaction = Transaction(
        id: incrementTransactionId(state.transactions?.lastOrNull?.id),
        createdAt: setDateWithoutTime(),
        description: event.newTransaction.description,
        value: event.newTransaction.value,
        category: event.newTransaction.category,
        type: event.newTransaction.type,
      );

      await _localStorage.addTransaction(transaction);

      return emit(
        state.copyWith(
          transactions: [...?state.transactions, transaction],
          status: TransactionsStatus.success,
        ),
      );
    } catch (e) {
      return emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }

  void _onSearchTermChanged(
    TransactionsSearched event,
    Emitter<TransactionsState> emit,
  ) {
    try {
      if (state.transactions == null) return;

      if (event.query.isEmpty) {
        return emit(
          state.copyWith(
            queriedTransactions: [],
            status: TransactionsStatus.success,
          ),
        );
      }

      final queriedTransactions = <Transaction>[];
      for (final transaction in state.transactions!) {
        if (transaction.queryable.contains(event.query.toLowerCase())) {
          queriedTransactions.add(transaction);
        }
      }

      return emit(
        state.copyWith(
          queriedTransactions: queriedTransactions,
          status: TransactionsStatus.success,
        ),
      );
    } catch (e) {
      return emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }

  @visibleForTesting
  int incrementTransactionId(int? id) {
    if (id == null) return 1;
    return id + 1;
  }

  @visibleForTesting
  DateTime setDateWithoutTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}
