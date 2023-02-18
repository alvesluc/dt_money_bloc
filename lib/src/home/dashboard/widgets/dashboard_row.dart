import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/dashboard/widgets/dashboard_card.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/shared/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardRow extends StatelessWidget {
  const DashboardRow({
    super.key,
    this.isExpanded = false,
  });

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        var income = 0.0;
        var expenses = 0.0;

        if (state.transactions != null && state.transactions!.isNotEmpty) {
          for (final transaction in state.transactions!) {
            if (transaction.type == TransactionType.income) {
              income += transaction.value;
            }
            if (transaction.type == TransactionType.expense) {
              expenses += transaction.value;
            }
          }
        }

        final total = income - expenses;

        return Row(
          children: [
            Expanded(
              flex: isExpanded ? 1 : 0,
              child: DashboardCard(
                title: l10n.dashboardIncomesCardLabel,
                value: income,
                icon: Icon(
                  Icons.arrow_circle_up_rounded,
                  size: 32,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Expanded(
              flex: isExpanded ? 1 : 0,
              child: DashboardCard(
                title: l10n.dashboardExpensesCardLabel,
                value: expenses,
                icon: Icon(
                  Icons.arrow_circle_down_rounded,
                  size: 32,
                  color: colorScheme.error,
                ),
              ),
            ),
            Expanded(
              flex: isExpanded ? 1 : 0,
              child: DashboardCard(
                title: l10n.dashboardTotalCardLabel,
                value: total,
                icon: Icon(
                  Icons.attach_money_rounded,
                  size: 32,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
