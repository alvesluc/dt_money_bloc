import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('Header', () {
    testWidgets(
      'renders Logo and the button that creates a new transaction',
      (tester) async {
        await tester.pumpApp(const Header());
        await tester.pumpAndSettle();

        expect(find.byType(NewTransactionButton), findsOneWidget);
        expect(find.byType(Logo), findsOneWidget);
      },
    );
  });
}
