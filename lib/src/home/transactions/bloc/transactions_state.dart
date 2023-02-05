part of 'transactions_bloc.dart';

enum TransactionsStatus { initial, loading, success, failure }

class TransactionsState extends Equatable {
  const TransactionsState({
    this.transactions,
    this.status = TransactionsStatus.initial,
  });

  final List<Transaction>? transactions;
  final TransactionsStatus status;

  @override
  List<Object?> get props => [transactions, status];

  TransactionsState copyWith({
    List<Transaction>? transactions,
    TransactionsStatus? status,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
    );
  }
}
