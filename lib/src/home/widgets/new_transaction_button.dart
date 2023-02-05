import 'package:dt_money/shared/widgets/primary_button.dart';
import 'package:dt_money/src/home/transactions/bloc/transaction_bloc.dart';
import 'package:dt_money/src/home/transactions/models/new_transaction.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
