import 'package:dt_money/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('l10n', () {
    testWidgets('is an instance of AppLocalizations', (tester) async {
      await tester.pumpApp(const Placeholder());
      await tester.pumpAndSettle();

      final BuildContext context = tester.element(
        find.byType(Placeholder),
      );

      expect(context.l10n, isInstanceOf<AppLocalizations>());
    });
  });
}
