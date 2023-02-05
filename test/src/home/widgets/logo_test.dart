import 'package:dt_money/gen/assets.gen.dart';
import 'package:dt_money/src/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('Logo', () {
    testWidgets('renders dark text version on light theme', (tester) async {
      await tester.pumpApp(const Logo());
      await tester.pumpAndSettle();

      expect(
        find.image(AssetImage(Assets.images.logoDarkText.path)),
        findsOneWidget,
      );
    });

    testWidgets('renders light text version on dark theme', (tester) async {
      await tester.pumpApp(const Logo(), themeMode: Brightness.dark);
      await tester.pumpAndSettle();

      expect(
        find.image(AssetImage(Assets.images.logo.path)),
        findsOneWidget,
      );
    });

    testWidgets(
      'on light theme renders 25dp version when isMobileSize is set to true',
      (tester) async {
        await tester.pumpApp(const Logo(isMobileSize: true));
        await tester.pumpAndSettle();

        final logo = find.byKey(ValueKey(Assets.images.logoDarkText.path));
        final imageWidget = tester.firstWidget<Image>(logo);

        expect(imageWidget.height, 25);
      },
    );

    testWidgets(
      'on dark theme renders 50dp version when isMobileSize is set to false',
      (tester) async {
        await tester.pumpApp(const Logo(), themeMode: Brightness.dark);
        await tester.pumpAndSettle();

        final logo = find.byKey(ValueKey(Assets.images.logo.path));
        final imageWidget = tester.firstWidget<Image>(logo);

        expect(imageWidget.height, 50);
      },
    );
    testWidgets(
      'on light theme renders 50dp version when isMobileSize is set to false',
      (tester) async {
        await tester.pumpApp(const Logo());
        await tester.pumpAndSettle();

        final logo = find.byKey(ValueKey(Assets.images.logoDarkText.path));
        final imageWidget = tester.firstWidget<Image>(logo);

        expect(imageWidget.height, 50);
      },
    );

    testWidgets(
      'on dark theme renders 25dp version when isMobileSize is set to true',
      (tester) async {
        await tester.pumpApp(
          const Logo(isMobileSize: true),
          themeMode: Brightness.dark,
        );
        await tester.pumpAndSettle();

        final logo = find.byKey(ValueKey(Assets.images.logo.path));
        final imageWidget = tester.firstWidget<Image>(logo);

        expect(imageWidget.height, 25);
      },
    );
  });
}
