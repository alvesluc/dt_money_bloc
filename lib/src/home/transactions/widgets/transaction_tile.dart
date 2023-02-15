import 'package:dt_money/src/shared/models/transaction.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:dt_money/src/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListTile(
      tileColor: colorScheme.surfaceVariant,
      title: Text(
        transaction.description,
        style: theme.textTheme.bodyLarge,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'R\$ ${transaction.value.toCurrency()}',
            style: theme.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: transaction.type == TransactionType.income
                  ? colorScheme.primary
                  : colorScheme.error,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.label_outline_rounded,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(transaction.category),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Text(DateFormat('dd/MM/y').format(transaction.createdAt)),
                ],
              ),
            ],
          ),
        ],
      ),
      isThreeLine: true,
    );
  }
}
