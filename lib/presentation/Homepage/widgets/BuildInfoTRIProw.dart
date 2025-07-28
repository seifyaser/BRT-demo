  import 'package:flutter/material.dart';

Widget buildInfoRow(String label, {
    String? value,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color.fromARGB(213, 54, 50, 50),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              trailing ??
                  Text(
                    value ?? "",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }