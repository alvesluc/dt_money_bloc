import 'package:dt_money/src/home/transactions/widgets/search_transactions.dart';
import 'package:dt_money/src/home/transactions/widgets/transactions_list.dart';
import 'package:dt_money/src/home/view/home_page.dart';
import 'package:dt_money/src/home/widgets/made_with_love.dart';
import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders DashboardHeader', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(find.byType(Header), findsOneWidget);
    });

    testWidgets('renders SearchTransactions', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(find.byType(SearchTransactions), findsOneWidget);
    });

    testWidgets('renders TransactionsList', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(find.byType(TransactionsList), findsOneWidget);
    });

    testWidgets('renders Divider', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('renders MadeWithLove', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pump();

      expect(find.byType(MadeWithLove), findsOneWidget);
    });
  });
}
