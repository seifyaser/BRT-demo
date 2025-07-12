import 'package:demo/presentation/TicketCardScreen/TicketCardScreen.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.diamond, size: 16),
                    SizedBox(width: 5),
                    Text('AL ZAHRAA', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Text('BRT', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
                    Text('Bus Rapid Transit', style: TextStyle(color: Color(0xff427292), fontSize: 12)),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.location_on_outlined, size: 16),
                    SizedBox(width: 5),
                    Text('AL SALAM', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Departure', style: TextStyle(color: Color(0xff878E8E), fontSize: 16)),
                    SizedBox(height: 4),
                    Text('16, Jan 2023', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Distance', style: TextStyle(color: Color(0xff878E8E), fontSize: 16)),
                    SizedBox(height: 4),
                    Text('35km', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Line with Bus Icon and arrows
            Row(
              children: [
                _circleDot(),
                _arrow(),
                _arrow(),
                _busIcon(),
                _arrow(),
                _arrow(),
                _circleDot(),
              ],
            ),

            const SizedBox(height: 16),

            // Bottom Price and Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'EGP 150',
                    style: TextStyle(color: Color(0xff427292), fontWeight: FontWeight.bold, fontSize: 18),
                    children: [
                      TextSpan(
                        text: '  Ticket Price',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal,fontSize: 15),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TicketScreen()));
                  },
                  child: const Text(
                    'View Details',
                    style: TextStyle(color: Color(0xFF009DAD), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _circleDot() {
    return const CircleAvatar(
      radius: 5,
      backgroundColor: Color(0xFF009DAD),
    );
  }

  Widget _arrow() {
    return const Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: 1,
        endIndent: 5,
        indent: 5,
      ),
    );
  }

  Widget _busIcon() {
    return const Icon(Icons.directions_bus, color: Color(0xFF3363FF), size: 35);
  }
}
