

import 'package:flutter/material.dart';

InputDecoration FormBuilderDecoration(String label, String hint,[Widget? SuffixIcon]) {
  return InputDecoration(
    suffixIcon: SuffixIcon,
    labelText: label,
    hintText: hint,
    labelStyle: const TextStyle(color: Color(0xffffffff)),
    hintStyle: const TextStyle(color: Color(0xff9CA3AF)),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    errorStyle: const TextStyle(color: Colors.redAccent),
    
  );
  
}
