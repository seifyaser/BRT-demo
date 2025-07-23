import 'package:demo/generated/l10n.dart';
import 'package:demo/models/TransactionDetailsModel.dart';
import 'package:demo/presentation/TicketCardScreen/TicketCardScreen.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final TransactionDetailModel ticket;

  const TicketCard({super.key, required this.ticket});

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
                  children: [
                    const Icon(Icons.diamond, size: 16),
                    const SizedBox(width: 5),
                    Text( "N/A",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Text('BRT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                    Text('Bus Rapid Transit',
                        style: TextStyle(color: Color(0xff427292), fontSize: 12)),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16),
                    const SizedBox(width: 5),
                    Text( "N/A",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).departure,
                        style: const TextStyle(color: Color(0xff878E8E), fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(ticket.tripDate.split("T").first ?? "N/A",
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(S.of(context).Distance,
                        style: const TextStyle(color: Color(0xff878E8E), fontSize: 16)),
                    const SizedBox(height: 4),
                    Text('35 km',
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: RichText(
                    text: TextSpan(
                      text: 'EGP ${ticket.price} ',
                      style: const TextStyle(
                          color: Color(0xff427292),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      children: [
                        TextSpan(
                          text: S.of(context).TicketPrice,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const TicketScreen()));
                  },
                  child: Text(
                    S.of(context).ViewDetails,
                    style: const TextStyle(
                        color: Color(0xFF009DAD), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleDot() => const CircleAvatar(radius: 5, backgroundColor: Color(0xFF009DAD));
  Widget _arrow() => const Expanded(child: Divider(color: Colors.grey, thickness: 1, endIndent: 5, indent: 5));
  Widget _busIcon() => const Icon(Icons.directions_bus, color: Color(0xFF3363FF), size: 35);
}

