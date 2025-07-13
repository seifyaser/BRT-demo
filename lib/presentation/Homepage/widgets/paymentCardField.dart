import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentCardField extends StatelessWidget {
  const PaymentCardField();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('assets/fawry.png', height: 45, width: 100),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              S.of(context).fawryMethod,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ),
          Icon(Icons.arrow_drop_down, color: Colors.grey),
        ],
      ),
    );
  }
}
