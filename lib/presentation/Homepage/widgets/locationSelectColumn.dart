import 'package:demo/generated/l10n.dart';
import 'package:demo/models/StationsModel.dart';
import 'package:flutter/material.dart';

class LocationSelectorColumn extends StatelessWidget {
  final List<StationModel> stations;
  final StationModel? selectedFrom;
  final StationModel? selectedTo;
  final ValueChanged<StationModel?> onFromChanged;
  final ValueChanged<StationModel?> onToChanged;
  final VoidCallback onSwapPressed;

  const LocationSelectorColumn({
    super.key,
    required this.stations,
    required this.selectedFrom,
    required this.selectedTo,
    required this.onFromChanged,
    required this.onToChanged,
    required this.onSwapPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<StationModel>(
          icon: const SizedBox.shrink(),
          value: selectedFrom,
          decoration: _inputDecoration(),
          items: _buildLocationItems(),
          hint: Center(
            child: Text(
              S.of(context).fromLabel,
              style: const TextStyle(color: Color(0xffa4a4a4), fontSize: 20),
            ),
          ),
          onChanged: onFromChanged,
          validator: (val) => val == null ? S.of(context).SelectLocationerror : null,
        ),

        const SizedBox(height: 10),

        GestureDetector(
          onTap: onSwapPressed,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFF427292),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/Swap.png'),
          ),
        ),

        const SizedBox(height: 10),

        DropdownButtonFormField<StationModel>(
            icon: const SizedBox.shrink(),
          value: selectedTo,
          decoration: _inputDecoration(),
          items: _buildLocationItems(),
          hint: Center(
            child: Text(
              S.of(context).toLabel,
              style: const TextStyle(color: Color(0xffa4a4a4), fontSize: 20),
            ),
          ),
          onChanged: onToChanged,
          validator: (val) => val == null ? S.of(context).SelectLocationerror : null,
        ),
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color.fromARGB(255, 181, 181, 181)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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


