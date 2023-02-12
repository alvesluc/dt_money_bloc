import 'package:intl/intl.dart';

extension ToReal on double {
  String toCurrency() {
    if (this == 0) return '0,00';
    return NumberFormat('#,###.00', 'pt_BR').format(this);
  }
}

extension LastOrNull<E> on List<E> {
  /// Returns `null` if [last] throws an error.
  ///
  /// When last is called in an empty List, it throws an [StateError], this
  /// extension prevents this behavior by returning null instead.
  E? get lastOrNull {
    try {
      return last;
    } catch (e) {
      return null;
    }
  }
}
