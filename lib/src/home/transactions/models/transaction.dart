import 'dart:convert';

import 'package:dt_money/src/shared/enums.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  const Transaction({
    required this.id,
    required this.createdAt,
    required this.description,
    required this.value,
    required this.category,
    required this.type,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      description: map['description'] as String,
      value: map['value'] as double,
      category: map['category'] as String,
      type: TransactionType.values.byName(map['type'].toString()),
    );
  }

  factory Transaction.fromJson(String source) {
    return Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  final String id;
  final DateTime createdAt;
  final String description;
  final double value;
  final String category;
  final TransactionType type;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{}
      ..addAll({'id': id})
      ..addAll({'id': id})
      ..addAll({'createdAt': createdAt.millisecondsSinceEpoch})
      ..addAll({'description': description})
      ..addAll({'value': value})
      ..addAll({'category': category})
      ..addAll({'type': type.name});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'Transaction(id: $id, createdAt: $createdAt, description: $description, value: $value, category: $category, type: ${type.name})';
  }

  @override
  List<Object?> get props {
    return [id, createdAt, description, value, category, type];
  }
}
