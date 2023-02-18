import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/home/transactions/widgets/empty_transactions.dart';
import 'package:dt_money/src/home/transactions/widgets/no_transactions_found.dart';
import 'package:dt_money/src/home/transactions/widgets/transaction_tile.dart';
import 'package:dt_money/src/shared/widgets/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1150),
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
          builder: (context, state) {
            switch (state.status) {
              case TransactionsStatus.initial:
                return const CircularProgressIndicator.adaptive();
              case TransactionsStatus.loading:
                return const CircularProgressIndicator.adaptive();
              case TransactionsStatus.success:
                if (state.transactions!.isEmpty) {
                  return const EmptyTransactions();
                }
                return ColumnBuilder.separated(
                  itemCount: state.transactions!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, i) {
                    final transactions = state.transactions!;
                    return TransactionTile(
                      transaction: transactions[i],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                );
              case TransactionsStatus.searched:
                if (state.queriedTransactions!.isEmpty) {
                  return const NoTransactionsFound();
                }
                return ColumnBuilder.separated(
                  itemCount: state.queriedTransactions!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, i) {
                    final transactions = state.queriedTransactions!;
                    return TransactionTile(
                      transaction: transactions[i],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                );
              case TransactionsStatus.failure:
                return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}
