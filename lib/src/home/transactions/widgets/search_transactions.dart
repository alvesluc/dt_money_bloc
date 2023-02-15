import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.searchForATransactionLabel,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: setQuery,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              border: Border.all(
                color: _query.isNotEmpty
                    ? colorScheme.primary
                    : colorScheme.outline,
                width: 2,
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
    );
  }
}
