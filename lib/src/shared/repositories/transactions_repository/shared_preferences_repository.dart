import 'dart:convert';

import 'package:dt_money/src/shared/enums.dart';
import 'package:dt_money/src/shared/models/transaction.dart';
import 'package:dt_money/src/shared/repositories/transactions_repository/transactions_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesTransactionsRepository
    implements TransactionsRepository {
  @override
  Future<List<Transaction>> getTransactions() async {
    return getStoredTransactions();
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final transactions = await getStoredTransactions();
    transactions.add(transaction);
    await sharedPreferences.setString('transactions', toJson(transactions));
  }

  @override
  Future<double> getAllExpenses() async {
    final transactions = await getStoredTransactions();
    var expenses = 0.0;

    for (final transaction in transactions) {
      if (transaction.type == TransactionType.expense) {
        expenses += transaction.value;
      }
    }

    return expenses;
  }

  @override
  Future<double> getAllIncome() async {
    final transactions = await getStoredTransactions();
    var income = 0.0;

    for (final transaction in transactions) {
      if (transaction.type == TransactionType.income) {
        income += transaction.value;
      }
    }

    return income;
  }

  @visibleForTesting
  Future<List<Transaction>> getStoredTransactions() async {
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

  @visibleForTesting
  String toJson(List<Transaction> transactions) {
    return jsonEncode(
      List<dynamic>.from(transactions.map((e) => e.toJson())),
    );
  }
}
