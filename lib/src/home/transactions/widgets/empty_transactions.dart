import 'package:dt_money/l10n/l10n.dart';
import 'package:flutter/material.dart';

class EmptyTransactions extends StatelessWidget {
  const EmptyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ListTile(
      title: Center(
        child: Text(l10n.transactionsWillBeShownHere),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text(
            l10n.seemsLikeItsEmptyTransactions,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
