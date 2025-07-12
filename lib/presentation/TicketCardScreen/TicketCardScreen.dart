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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 130),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TicketCardDetails(),
            ),
          ),
        ],
      ),
    );
  }
}



