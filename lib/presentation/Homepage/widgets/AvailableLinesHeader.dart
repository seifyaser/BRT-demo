import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:demo/presentation/Homepage/widgets/LocationLine.dart';

class AvailableLinesHeader extends StatelessWidget {
  const AvailableLinesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Center(
          child: Text(
            S.of(context).availableLines,
            style: TextStyle(fontSize: 16, color: Color(0xff9C9A9A)),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LocationLine(
              text: S.of(context).alQalyubia,
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            LocationLine(
              text: S.of(context).giza,
              color: Color.fromARGB(255, 255, 166, 0),
            ),
            LocationLine(
              text: S.of(context).cairo,
              color: Color.fromARGB(255, 230, 0, 255),
            ),
          ],
        ),
      ],
    );
  }
}
