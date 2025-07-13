import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          S.of(context).welcomeBack,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          S.of(context).enjoySmartPowerfulExperience,
          style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
        ),
      ],
    );
  }
}
