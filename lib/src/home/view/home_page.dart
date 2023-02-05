import 'package:dt_money/shared/services/shared_preferences_service/shared_preferences_service.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionsBloc(SharedPreferencesImpl())
        ..add(
          TransactionsFetched(),
        ),
      child: Scaffold(
        body: ListView(
          children: const [
            Header(),
          ],
        ),
      ),
    );
  }
}
