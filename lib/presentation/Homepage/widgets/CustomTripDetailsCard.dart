import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:demo/models/TicketCategoryModel.dart';
import 'BuildInfoTRIProw.dart';

class CustomTripDetailsCard extends StatelessWidget {
  final DateTime? selectedReserveDate;
  final Function()? onDateTap;
  final TicketCategoryModel? ticket;

  const CustomTripDetailsCard({
    Key? key,
    required this.selectedReserveDate,
    required this.onDateTap,
    this.ticket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildInfoRow(
              "لون التذكرة",
              trailing: Icon(
                Icons.circle,
                color: _getColorFromName(ticket?.color),
              ),
            ),
            buildInfoRow(
              "عدد المحطات",
              value: ticket?.stationCount.toString() ?? "-",
            ),
            buildInfoRow(
              "السعر",
              value: ticket?.price != null
                  ? "${ticket!.price.toStringAsFixed(2)} ج.م"
                  : "-",
            ),
            buildInfoRow(
              "تاريخ الحجز",
              value: selectedReserveDate != null
                  ? DateFormat('yyyy-MM-dd').format(selectedReserveDate!)
                  : "اختر",
              onTap: onDateTap,
            ),
            buildInfoRow("عدد التذاكر", value: "1"),
            SizedBox(height: 20),
            SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                               
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF427292,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 60,
                                                      vertical: 15,
                                                    ),
                                              ),
                                              child: Text(
                                                'حجز التذكرة',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
          ],
        ),
      ),
    );
  }

  Color _getColorFromName(String? name) {
    switch (name?.toLowerCase()) {
      case 'green':
      case 'أخضر':
        return Colors.green;
      case 'blue':
      case 'أزرق':
        return Colors.blue;
      case 'red':
      case 'أحمر':
        return Colors.red;
      case 'yellow':
      case 'أصفر':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
