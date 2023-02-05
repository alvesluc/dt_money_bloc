import 'package:dt_money/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class NewTransactionButton extends StatelessWidget {
  const NewTransactionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: 'Nova transação',
      onPressed: () async {},
    );
  }
}
