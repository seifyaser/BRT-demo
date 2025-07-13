import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormReswerveDateDecoration extends StatelessWidget {
  final DateTime? value;
  final String? errorText;

  const FormReswerveDateDecoration({
    Key? key,
    required this.value,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: S.of(context).reserveDate,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
        errorText: errorText,
      ),
      child: Text(
        value != null
            ? DateFormat('dd/MM/yyyy').format(value!)
            : '11/11/2023',
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
