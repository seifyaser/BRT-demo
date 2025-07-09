import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TicketCountField extends StatelessWidget {
  final int? value;
  final Function(dynamic)? onChanged;

  const TicketCountField({super.key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: 'ticket_count',
      initialValue: value?.toString(),
      keyboardType: TextInputType.number,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: 'please enter ticket count'),
      ]),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Ticket Count',
        hintText: 'example : 1',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.confirmation_number_outlined, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF3363FF)),
        ),
      ),
    );
  }
}
