import 'package:dt_money/l10n/l10n.dart';
import 'package:flutter/material.dart';

class NoTransactionsFound extends StatelessWidget {
  const NoTransactionsFound({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListTile(
      title: Center(
        child: Text(l10n.noTransactionsFound),
      ),
    );
  }
}
