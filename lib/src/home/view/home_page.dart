import 'package:dt_money/src/home/dashboard/widgets/dashboard.dart';
import 'package:dt_money/src/home/transactions/widgets/search_transactions.dart';
import 'package:dt_money/src/home/transactions/widgets/transactions_list.dart';
import 'package:dt_money/src/home/widgets/made_with_love.dart';
import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Header(),
          Dashboard(),
          SearchTransactions(),
          TransactionsList(),
          SizedBox(height: 20),
          MadeWithLove(),
        ],
      ),
    );
  }
}
