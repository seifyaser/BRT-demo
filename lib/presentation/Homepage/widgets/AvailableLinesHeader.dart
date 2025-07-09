import 'package:flutter/material.dart';
import 'package:demo/presentation/Homepage/widgets/LocationLine.dart';

class AvailableLinesHeader extends StatelessWidget {
  const AvailableLinesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            'Available lines',
            style: TextStyle(fontSize: 16, color: Color(0xff9C9A9A)),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LocationLine(
              text: 'Al Qalyubia',
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            LocationLine(
              text: 'Giza',
              color: Color.fromARGB(255, 255, 166, 0),
            ),
            LocationLine(
              text: 'Cairo',
              color: Color.fromARGB(255, 230, 0, 255),
            ),
          ],
        ),
      ],
    );
  }
}
