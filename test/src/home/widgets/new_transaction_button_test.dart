import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/widgets/new_transaction_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('NewTransactionButton', () {
    testWidgets('renders', (tester) async {
      await tester.pumpApp(const NewTransactionButton());
      await tester.pumpAndSettle();

      final BuildContext context = tester.element(
        find.byType(NewTransactionButton),
      );

      final newTransactionButton = find.byType(NewTransactionButton);
      final transactionButtonText = tester.firstWidget<Text>(
        find.descendant(
          of: newTransactionButton,
          matching: find.byType(Text),
        ),
      );

      expect(newTransactionButton, findsOneWidget);
      expect(
        transactionButtonText.data,
        context.l10n.newTransactionButtonLabel,
      );
    });
  });
}
