import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:dt_money/src/shared/models/new_transaction.dart';
import 'package:dt_money/src/shared/widgets/default_text_field.dart';
import 'package:dt_money/src/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewTransactionSheet extends StatefulWidget {
  const NewTransactionSheet({super.key});

  @override
  State<NewTransactionSheet> createState() => _NewTransactionSheet();
}

class _NewTransactionSheet extends State<NewTransactionSheet> {
  final formKey = GlobalKey<FormState>();
  final currencyFormatter = CurrencyTextInputFormatter(
    decimalDigits: 2,
    locale: 'pt_BR',
    symbol: r'R$',
  );

  String description = '';
  double value = 0;
  String category = '';
  String errorMessage = '';
  TransactionType transactionType = TransactionType.undefined;

  void _setTransactionType(Set<TransactionType> type) {
    setState(() {
      transactionType = type.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.newTransactionTitle,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            DefaultTextField(
              label: l10n.descriptionLabel,
              onChanged: (text) => description = text,
            ),
            const SizedBox(height: 12),
            DefaultTextField(
              label: l10n.priceLabel,
              formatters: [currencyFormatter],
              onChanged: (_) {
                value = currencyFormatter.getUnformattedValue() as double;
              },
            ),
            const SizedBox(height: 12),
            DefaultTextField(
              label: l10n.categoryLabel,
              onChanged: (text) => category = text,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: SegmentedButton<TransactionType>(
                emptySelectionAllowed: true,
                segments: [
                  ButtonSegment(
                    value: TransactionType.income,
                    label: Text(
                      l10n.income,
                      style: theme.textTheme.bodyMedium,
                    ),
                    icon: Icon(
                      Icons.arrow_circle_up,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  ButtonSegment(
                    icon: Icon(
                      Icons.arrow_circle_down,
                      color: theme.colorScheme.error,
                    ),
                    value: TransactionType.expense,
                    label: Text(
                      l10n.expense,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
                selected: <TransactionType>{transactionType},
                onSelectionChanged: _setTransactionType,
              ),
            ),
            if (errorMessage.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 4),
                  Text(
                    errorMessage,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              child: PrimaryButton(
                label: l10n.registerTransactionLabel,
                onPressed: () => registerTransaction(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerTransaction(BuildContext context) async {
    clearInvalidTypeError();
    if (transactionType != TransactionType.undefined) {
      final newTransaction = NewTransaction(
        description: description,
        value: value,
        category: category,
        type: transactionType,
      );

      context.read<TransactionsBloc>().add(TransactionAdded(newTransaction));
      Navigator.pop(context);
    }
    showInvalidTypeError();
  }

  void showInvalidTypeError() {
    setState(() {
      errorMessage = context.l10n.chooseATransactionTypeError;
    });
  }

  void clearInvalidTypeError() {
    setState(() {
      errorMessage = '';
    });
  }
}
