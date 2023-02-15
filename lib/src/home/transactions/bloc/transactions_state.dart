part of 'transactions_bloc.dart';

enum TransactionsStatus { initial, loading, success, searched, failure }

class TransactionsState extends Equatable {
  const TransactionsState({
    this.transactions,
    this.queriedTransactions,
    this.status = TransactionsStatus.initial,
  });

  final List<Transaction>? transactions;
  final List<Transaction>? queriedTransactions;
  final TransactionsStatus status;

  @override
  List<Object?> get props => [transactions, queriedTransactions, status];

  TransactionsState copyWith({
    List<Transaction>? transactions,
    List<Transaction>? queriedTransactions,
    TransactionsStatus? status,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      queriedTransactions: queriedTransactions ?? this.queriedTransactions,
      status: status ?? this.status,
    );
  }
}
