import 'package:dt_money/shared/widgets/primary_button.dart';
import 'package:dt_money/src/dashboard/widgets/logo.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 720) {
          return const _TabletOrBiggerDashboardHeader();
        }
        return const _MobileDashboardHeader();
      },
    );
  }
}

class _TabletOrBiggerDashboardHeader extends StatelessWidget {
  const _TabletOrBiggerDashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 200,
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Logo(),
            PrimaryButton(
              label: 'Nova transação',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _MobileDashboardHeader extends StatelessWidget {
  const _MobileDashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 200,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Logo(isMobileSize: true),
          PrimaryButton(
            label: 'Nova transação',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
