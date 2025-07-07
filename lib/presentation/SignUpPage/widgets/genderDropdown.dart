import 'package:demo/presentation/SignUpPage/widgets/FormBuilderDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final FormFieldValidator<T>? validator;
  final void Function(T?)? onChanged;

  const CustomDropdownField({
    Key? key,

    required this.items,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: 'gender',

      decoration: FormBuilderDecoration('Gender', 'Select your gender'),
      items: items,
      style: const TextStyle(color: Colors.white),

      dropdownColor: const Color(0xff1E1E1E),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
