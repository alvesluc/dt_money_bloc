part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

class TransactionsFetched extends TransactionsEvent {}

class TransactionAdded extends TransactionsEvent {
  const TransactionAdded(this.newTransaction);

  final NewTransaction newTransaction;

  @override
  List<Object> get props => [newTransaction];
}

class TransactionsSearched extends TransactionsEvent {
  const TransactionsSearched(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
