import 'package:intl/intl.dart';

extension ToReal on double {
  String toCurrency() {
    if (this == 0) return '0,00';
    return NumberFormat('#,###.00', 'pt_BR').format(this);
  }
}
