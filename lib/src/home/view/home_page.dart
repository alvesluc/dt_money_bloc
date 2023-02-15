import 'package:dt_money/src/home/dashboard/widgets/dashboard.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/home/transactions/widgets/search_transactions.dart';
import 'package:dt_money/src/home/transactions/widgets/transactions_list.dart';
import 'package:dt_money/src/home/widgets/made_with_love.dart';
import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:dt_money/src/shared/repositories/transactions_repository/shared_preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsBloc(SharedPreferencesTransactionsRepository())
        ..add(
          TransactionsFetched(),
        ),
      child: Scaffold(
        body: ListView(
          children: const [
            Header(),
            Dashboard(),
            SearchTransactions(),
            TransactionsList(),
            Divider(indent: 20, endIndent: 20),
            MadeWithLove(),
          ],
        ),
      ),
    );
  }
}
