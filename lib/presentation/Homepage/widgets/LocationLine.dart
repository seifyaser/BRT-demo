import 'package:flutter/material.dart';

class LocationLine extends StatelessWidget {
  final String text;
  final Color color;

  const LocationLine({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 10),
        SizedBox(width: 5),
        Text(text, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
      ],
    );
  }
}
