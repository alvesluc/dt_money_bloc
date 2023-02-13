import 'package:dt_money/src/shared/enums.dart';
import 'package:equatable/equatable.dart';

class NewTransaction extends Equatable {
  const NewTransaction({
    required this.description,
    required this.value,
    required this.category,
    required this.type,
  });

  final String description;
  final double value;
  final String category;
  final TransactionType type;

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'NewTransaction(description: $description, value: $value, category: $category, type: ${type.name})';
  }

  @override
  List<Object?> get props => [description, value, category, type];
}
