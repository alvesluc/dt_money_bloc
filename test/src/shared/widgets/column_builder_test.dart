import 'package:dt_money/src/shared/widgets/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('ColumnBuilder', () {
    testWidgets('renders Column and widgets from builder', (tester) async {
      const itemCount = 6;

      await tester.pumpApp(
        ColumnBuilder(
          itemCount: itemCount,
          itemBuilder: (context, i) {
            return const SizedBox();
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsNWidgets(itemCount));
    });

    testWidgets(
        'separated renders Column, widgets from builder and widgets '
        'from separatorBuilder', (tester) async {
      const itemCount = 4;

      await tester.pumpApp(
        ColumnBuilder.separated(
          itemCount: itemCount,
          itemBuilder: (context, i) {
            return const Placeholder(fallbackHeight: 10);
          },
          separatorBuilder: (context, i) {
            return const Divider();
          },
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Column), findsNWidgets(itemCount));
      expect(find.byType(Placeholder), findsNWidgets(itemCount));
      expect(find.byType(Divider), findsNWidgets(itemCount - 1));
    });
  });
}
