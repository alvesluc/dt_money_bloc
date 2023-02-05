import 'package:dt_money/src/home/view/home_page.dart';
import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('HomePage', () {
    testWidgets('renders DashboardHeader', (tester) async {
      await tester.pumpApp(const HomePage());
      await tester.pumpAndSettle();

      expect(find.byType(Header), findsOneWidget);
    });
  });
}
