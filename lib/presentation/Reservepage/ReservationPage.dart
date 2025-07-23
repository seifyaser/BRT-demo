import 'package:demo/generated/l10n.dart';
import 'package:demo/models/TransactionDetailsModel.dart';
import 'package:demo/presentation/Homepage/widgets/ticketCard.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
   final List<TransactionDetailModel> tickets;

  const ReservationPage({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Background Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF427292), Color(0xFF3363FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
  padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
       Expanded(
        child: Center(
          child: Text(
            S.of(context).TicketReservation,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      const SizedBox(width: 48)
    ],
  ),
),
            ),
          ),

          // Content
           Positioned.fill(
            top: 140,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: TicketCard(ticket: ticket), 
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
