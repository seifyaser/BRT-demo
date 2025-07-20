import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:demo/models/TicketCategoryModel.dart';
import 'BuildInfoTRIProw.dart';

class CustomTripDetailsCard extends StatelessWidget {
  final DateTime? selectedReserveDate;
  final Function()? onDateTap;
  final TicketCategoryModel? ticket;
  final int ticketCount;
  final void Function()? onReserve;
  final void Function(int)? onCountChanged;

  const CustomTripDetailsCard({
    Key? key,
    required this.selectedReserveDate,
    required this.onDateTap,
    required this.ticket,
    this.ticketCount = 1,
    this.onReserve,
    this.onCountChanged,
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
            buildInfoRow(
  "عدد التذاكر",
  trailing: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: () {
          if (ticketCount > 1) onCountChanged?.call(ticketCount - 1);
        },
        icon: Icon(Icons.remove),
      ),
      Text(ticketCount.toString(), style: TextStyle(fontSize: 16)),
      IconButton(
        onPressed: () {
          if (ticketCount < (ticket?.maxCount ?? 10)) onCountChanged?.call(ticketCount + 1);
        },
        icon: Icon(Icons.add),
      ),
    ],
  ),
),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onReserve,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF427292),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
                child: const Text(
                  'حجز التذكرة',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
