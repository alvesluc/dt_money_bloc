import 'package:dt_money/src/shared/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('toCurrency', () {
    test('formats properly zero', () {
      const value = 0.0;
      expect(value.toCurrency(), '0,00');
    });

    test('formats properly unit', () {
      const value = 1.0;
      expect(value.toCurrency(), '1,00');
    });

    test('formats properly ten', () {
      const value = 10.0;
      expect(value.toCurrency(), '10,00');
    });

    test('formats properly hundred', () {
      const value = 100.0;
      expect(value.toCurrency(), '100,00');
    });

    test('formats properly thousand', () {
      const value = 1000.0;
      expect(value.toCurrency(), '1.000,00');
    });

    group('lastOrNull', () {
      test('returns last when list is not empty', () {
        final list = <String>['first', 'last'];
        expect(list.lastOrNull, 'last');
      });

      test('returns null when list is empty', () {
        final list = <Object>[];
        expect(list.lastOrNull, null);
      });
    });
  });
}
