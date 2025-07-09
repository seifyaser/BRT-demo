 import 'package:flutter/material.dart';

class PriceField extends StatelessWidget {
   Widget build(BuildContext context) {
     return TextField(
      readOnly: true, // Price is expected, not input
      controller: TextEditingController(text: '150 EGP'),
      decoration: InputDecoration(
        labelText: 'Expected Price',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(Icons.attach_money, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF3363FF)),
        ),
      ),
    );
   }
 }
