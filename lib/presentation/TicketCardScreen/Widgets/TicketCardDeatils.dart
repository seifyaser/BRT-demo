import 'package:demo/presentation/TicketCardScreen/Widgets/TripDetailsItem.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketCardDetails extends StatelessWidget {
  const TicketCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff0E4E80),
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "BRT",
                      style: TextStyle(
                        color: Color(0xff0E4E80),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Ticket #2231",
                      style: TextStyle(
                        color: Color(0xff0E4E80),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Trip Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey),
                        SizedBox(width: 5),
                        Text("AL ZAHRAA"),
                      ],
                    ),
                    Icon(Icons.sync_alt, color: Colors.grey),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey),
                        SizedBox(width: 5),
                        Text("AL SALAM"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TripDetailItem(title: "Departure", value: "16, Jan 2023"),
                    TripDetailItem(title: "Distance", value: "35km"),
                    TripDetailItem(title: "No.Ticket", value: "5"),
                    TripDetailItem(title: "Price", value: "150 LE"),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // QR Code
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: QrImageView(
              data: "https://example.com/ticket/2231",
              version: QrVersions.auto,
              size: 120.0,
            ),
          ),

          // Note
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "قم بمسح رمز الاستجابة السريعة هذا عند البوابة قبل\nبطاقة الصعود إلى الأوتوبيس",
              style: TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}