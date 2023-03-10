import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/shared/widgets/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTransactions extends StatefulWidget {
  const SearchTransactions({super.key});

  @override
  State<SearchTransactions> createState() => _SearchTransactionsState();
}

class _SearchTransactionsState extends State<SearchTransactions> {
  var _query = '';

  void setQuery(String value) {
    setState(() => _query = value);
    if (_query.isEmpty) {
      context.read<TransactionsBloc>().add(
            const TransactionsSearched(''),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Align(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1150),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: DefaultTextField(
                label: l10n.searchForATransactionLabel,
                onChanged: setQuery,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              constraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
                maxHeight: 56,
                maxWidth: 56,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _query.isNotEmpty
                      ? colorScheme.primary
                      : colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                style: const ButtonStyle().copyWith(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(),
                  ),
                ),
                onPressed: _query.isNotEmpty
                    ? () {
                        context.read<TransactionsBloc>().add(
                              TransactionsSearched(_query),
                            );
                      }
                    : null,
                child: Icon(
                  Icons.search,
                  color: _query.isNotEmpty
                      ? colorScheme.primary
                      : colorScheme.outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
