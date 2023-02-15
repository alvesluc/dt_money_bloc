import 'package:dt_money/src/home/dashboard/widgets/dashboard_row.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 920) {
          return Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: 1120,
              child: const DashboardRow(isExpanded: true),
            ),
          );
        }
        return const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DashboardRow(),
          ),
        );
      },
    );
  }
}
