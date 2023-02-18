// Copyright (c) 2023, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:dt_money/l10n/l10n.dart';
import 'package:dt_money/src/home/transactions/bloc/transactions_bloc.dart';
import 'package:dt_money/src/shared/repositories/transactions_repository/shared_preferences_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    Brightness themeMode = Brightness.light,
  }) {
    return pumpWidget(
      BlocProvider(
        create: (context) => TransactionsBloc(
          SharedPreferencesTransactionsRepository(),
        ),
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          theme: ThemeData(brightness: themeMode),
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
