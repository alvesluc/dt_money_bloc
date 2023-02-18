import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.formatters,
  });

  final String label;
  final ValueSetter<String> onChanged;
  final List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: label,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      inputFormatters: formatters,
      onChanged: onChanged,
    );
  }
}
