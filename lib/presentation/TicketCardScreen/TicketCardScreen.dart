import 'package:demo/generated/l10n.dart';
import 'package:demo/presentation/TicketCardScreen/Widgets/TicketCardDeatils.dart';
import 'package:flutter/material.dart';


class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF427292), Color(0xFF3363FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
  padding: const EdgeInsets.only(top: 25, left: 10, right: 15, bottom: 135),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
     
      const SizedBox(width: 48)
    ],
  ),
),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 125, left: 20, right: 20),
            child: TicketCardDetails(),
          ),
        ],
      ),
    );
  }
}



