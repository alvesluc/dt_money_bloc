part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionsFetched extends TransactionEvent {}

class TransactionAdded extends TransactionEvent {
  const TransactionAdded(this.newTransaction);

  final NewTransaction newTransaction;

  @override
  List<Object> get props => [newTransaction];
}

class TransactionSearched extends TransactionEvent {
  const TransactionSearched(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}
