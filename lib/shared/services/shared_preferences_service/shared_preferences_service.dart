import 'dart:convert';

import 'package:dt_money/shared/services/local_storage_service.dart';
import 'package:dt_money/src/home/transactions/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements LocalStorageService {
  @override
  Future<List<Transaction>> getTransactions() async {
    return _getStoredTransactions();
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final transactions = await _getStoredTransactions();
    transactions.add(transaction);
    print(transactions);
    await sharedPreferences.setString('transactions', _toJson(transactions));
  }

  Future<List<Transaction>> _getStoredTransactions() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storedTransactionsJson = sharedPreferences.getString('transactions');

    final transactions = <Transaction>[];

    if (storedTransactionsJson != null) {
      final storedTransactions = jsonDecode(storedTransactionsJson);
      for (final transactionJson in storedTransactions as List) {
        transactions.add(Transaction.fromJson(transactionJson as String));
      }
    }

    return transactions;
  }

  String _toJson(List<Transaction> transactions) {
    return jsonEncode(
      List<dynamic>.from(transactions.map((e) => e.toJson())),
    );
  }
}
