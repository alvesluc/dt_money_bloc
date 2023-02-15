import 'package:dt_money/src/shared/extensions.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
  });

  final String title;
  final double value;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SizedBox(
      width: 280,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: textTheme.bodyLarge),
                  icon,
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'R\$ ${value.toCurrency()}',
                style: textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
