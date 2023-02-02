import 'package:dt_money/src/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardHeader(),
    );
  }
}
