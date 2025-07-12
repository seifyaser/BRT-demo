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
      icon: const SizedBox.shrink(), 
      decoration: InputDecoration(
        labelText: 'Gender',
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      dropdownColor: const Color(0xff1E1E1E),
      validator: validator,
      onChanged: onChanged,
      hint: const Text(
        'Select Gender',
                style: const TextStyle(color: Color.fromARGB(221, 255, 251, 251), fontSize: 16),
      ),

      items: items,
    );
  }
}
