import 'package:dt_money/src/app/view/app.dart';
import 'package:dt_money/src/dashboard/view/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders DashboardPage', (tester) async {
      await tester.pumpWidget(const DtMoneyApp());
      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}
