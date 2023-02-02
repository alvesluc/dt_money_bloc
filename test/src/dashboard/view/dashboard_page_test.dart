import 'package:dt_money/src/dashboard/view/dashboard_page.dart';
import 'package:dt_money/src/dashboard/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DashboardPage', () {
    testWidgets('renders DashboardHeader', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardHeader), findsOneWidget);
    });
  });
}
