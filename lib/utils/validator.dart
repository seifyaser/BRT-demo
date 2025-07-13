import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class Validators {
  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourPassword;
    }
    if (value.length < 6) {
      return S.of(context).passwordMinLengthError;
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).pleaseEnterYourEmail;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return S.of(context).invalidEmailError;
    }

    return null;
  }
}
