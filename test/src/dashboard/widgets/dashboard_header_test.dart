import 'package:dt_money/shared/widgets/primary_button.dart';
import 'package:dt_money/src/dashboard/widgets/dashboard_header.dart';
import 'package:dt_money/src/dashboard/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('DashboardHeader', () {
    testWidgets(
      'renders Logo and the button that creates a new transaction',
      (tester) async {
        await tester.pumpApp(const DashboardHeader());
        await tester.pumpAndSettle();

        final newTransactionButton = find.byType(PrimaryButton);
        final transactionButtonText = tester.firstWidget<Text>(
          find.descendant(
            of: newTransactionButton,
            matching: find.byType(Text),
          ),
        );

        expect(newTransactionButton, findsOneWidget);
        expect(transactionButtonText.data, 'Nova transação');
        expect(find.byType(Logo), findsOneWidget);
      },
    );
  });
}
