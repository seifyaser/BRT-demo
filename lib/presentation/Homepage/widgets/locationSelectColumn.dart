import 'package:demo/generated/l10n.dart';
import 'package:demo/models/StationsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LocationSelectorColumn extends StatelessWidget {
  final List<StationModel> stations;
  final StationModel? selectedFrom;
  final StationModel? selectedTo;
  final ValueChanged<StationModel?> onFromChanged;
  final ValueChanged<StationModel?> onToChanged;

  const LocationSelectorColumn({
    super.key,
    required this.stations,
    required this.selectedFrom,
    required this.selectedTo,
    required this.onFromChanged,
    required this.onToChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderDropdown<StationModel>(
          name: 'from_location',
          icon: const SizedBox.shrink(),
          initialValue: selectedFrom,
          decoration: _inputDecoration(),
          items: _buildLocationItems(),
            hint: Center(
            child: Text(
              'From',
              style: const TextStyle(color: Color(0xffa4a4a4),fontSize: 20),
            ),
          ),
          onChanged: onFromChanged,
          validator: FormBuilderValidators.required(
            errorText: S.of(context).SelectLocationerror,
          ),
        ),
        const SizedBox(height: 10),

        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF427292),
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/Swap.png'),
        ),

        const SizedBox(height: 10),
        FormBuilderDropdown<StationModel>(
          name: 'to_location',
          icon: const SizedBox.shrink(),
          initialValue: selectedTo,
          decoration: _inputDecoration(),
          items: _buildLocationItems(),
          hint: Center(
            child: Text(
              'To',
              style: const TextStyle(color: Color(0xffa4a4a4),fontSize: 20),
            ),
          ),
          onChanged: onToChanged,
          validator: FormBuilderValidators.required(
            errorText: S.of(context).SelectLocationerror,
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
    
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color:  Color.fromARGB(255, 181, 181, 181)),
    ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        ),
      contentPadding: const EdgeInsets.symmetric( vertical: 20),
    );
  }

  List<DropdownMenuItem<StationModel>> _buildLocationItems() {
    return stations.map((station) {
      return DropdownMenuItem<StationModel>(
        value: station,
        child: Text(station.nameAr),
      );
    }).toList();
  }
}

