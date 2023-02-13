import 'package:dt_money/src/shared/models/transaction.dart';

abstract class TransactionsRepository {
  Future<void> addTransaction(Transaction transaction);
  Future<List<Transaction>> getTransactions();
  Future<double> getAllIncome();
  Future<double> getAllExpenses();
}
