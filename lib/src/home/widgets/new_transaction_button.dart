import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/transactions/widgets/new_transaction_sheet.dart';
import 'package:dt_money/src/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class NewTransactionButton extends StatelessWidget {
  const NewTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return PrimaryButton(
      label: l10n.newTransactionButtonLabel,
      onPressed: () {
        showModalBottomSheet<void>(
          constraints: const BoxConstraints(maxWidth: 600),
          context: context,
          builder: (context) {
            return const NewTransactionSheet();
          },
        );
      },
    );
  }
}
