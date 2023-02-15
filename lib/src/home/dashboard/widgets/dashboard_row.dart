import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/dashboard/widgets/dashboard_card.dart';
import 'package:flutter/material.dart';

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

    return Row(
      children: [
        Expanded(
          flex: isExpanded ? 1 : 0,
          child: DashboardCard(
            title: l10n.dashboardIncomesCardLabel,
            value: 0,
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
            value: 0,
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
            value: 0,
            icon: Icon(
              Icons.attach_money_rounded,
              size: 32,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
