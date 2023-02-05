import 'package:dt_money/src/app/view/app.dart';
import 'package:dt_money/src/home/view/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const DtMoneyApp());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
