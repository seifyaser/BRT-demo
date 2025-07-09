import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LocationSelectorRow extends StatelessWidget {
  final List<String> locations;
  final String? selectedFrom;
  final String? selectedTo;
  final ValueChanged<String?> onFromChanged;
  final ValueChanged<String?> onToChanged;
  final String? hint;

  const LocationSelectorRow({
    super.key,
    required this.locations,
    required this.selectedFrom,
    required this.selectedTo,
    required this.onFromChanged,
    required this.onToChanged,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FormBuilderDropdown<String>(
            name: 'from_location',
            icon: SizedBox.shrink(), // to hide the default dropdown icon
            initialValue: selectedFrom,
            decoration: _inputDecoration(label: 'From'),
            items: _buildLocationItems(),
            onChanged: onFromChanged,
            validator: FormBuilderValidators.required(
              errorText: 'select a location',
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF427292),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/Swap.png',
            
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FormBuilderDropdown<String>(
            icon: SizedBox.shrink(), // to hide the default dropdown icon

            name: 'to_location',
            initialValue: selectedTo,
            decoration: _inputDecoration(label: 'To'),
            items: _buildLocationItems(),
            onChanged: onToChanged,
            validator: FormBuilderValidators.required(
              errorText: 'select a location',
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({required String label}) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF3363FF)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    );
  }

  List<DropdownMenuItem<String>> _buildLocationItems() {
    return locations.map((String location) {
      return DropdownMenuItem<String>(value: location, child: Text(location));
    }).toList();
  }
}
