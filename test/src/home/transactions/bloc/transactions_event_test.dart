// ignore_for_file: prefer_const_constructors
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/home/transactions/models/new_transaction.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionsEvent', () {
    group('TransactionsFetched', () {
      test('supports value comparison', () {
        expect(TransactionsFetched(), TransactionsFetched());
      });
    });
    group('TransactionAdded', () {
      test('supports value comparison', () {
        expect(
          TransactionAdded(
            NewTransaction(
              description: '',
              value: 0,
              category: '',
              type: TransactionType.income,
            ),
          ),
          TransactionAdded(
            NewTransaction(
              description: '',
              value: 0,
              category: '',
              type: TransactionType.income,
            ),
          ),
        );
      });
    });
    group('TransactionsSearched', () {
      test('supports value comparison', () {
        expect(TransactionsSearched(''), TransactionsSearched(''));
      });
    });
  });
}
