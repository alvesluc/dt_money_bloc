import 'package:dt_money/src/home/transactions/models/transaction.dart';

abstract class LocalStorageService {
  Future<void> addTransaction(Transaction transaction);
  Future<List<Transaction>> getTransactions();
}
