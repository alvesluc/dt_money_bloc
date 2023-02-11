import 'package:bloc/bloc.dart';
import 'package:dt_money/shared/services/local_storage_service.dart';
import 'package:dt_money/src/home/transactions/models/new_transaction.dart';
import 'package:dt_money/src/home/transactions/models/transaction.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc(this._localStorage) : super(const TransactionsState()) {
    on(_fetchTransactions);
    on(_onAddTransaction);
    on(_onSearchTermChanged);
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
        id: incrementTransactionId(state.transactions?.last.id),
        createdAt: setDateWithoutTime(),
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
    } catch (e) {
      emit(state.copyWith(status: TransactionsStatus.failure));
    }
  }

  void _onSearchTermChanged(
    TransactionsSearched event,
    Emitter<TransactionsState> emit,
  ) {
    if (state.transactions == null) return;

    final queriedTransactions = <Transaction>[];
    for (final transaction in state.transactions!) {
      if (transaction.queryable.contains(event.query.toLowerCase())) {
        queriedTransactions.add(transaction);
      }
    }

    emit(
      state.copyWith(
        transactions: queriedTransactions,
        status: TransactionsStatus.success,
      ),
    );
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
