// ignore_for_file: prefer_const_constructors
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TransactionsState', () {
    test('supports value comparison', () {
      expect(TransactionsState(), TransactionsState());
      expect(
        TransactionsState(),
        TransactionsState(),
      );
    });

    test('copyWith returns copy', () {
      expect(
        TransactionsState().copyWith(),
        TransactionsState(),
      );
    });
  });
}
