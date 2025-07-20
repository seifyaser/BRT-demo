import 'package:flutter/material.dart';

ButtonStyle searchButtonStyle() {
  return ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color(0xFF427292),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 60,
      vertical: 15,
    ),
    textStyle: const TextStyle(
      color: Colors.white,      
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}
