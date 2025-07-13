import 'package:demo/generated/l10n.dart';
import 'package:demo/widgets/BackgroundImages.dart';
import 'package:demo/widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.centerText, required this.DescriptionText});
  final String centerText;
  final String DescriptionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImages(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/SuccessAniamtion.json', height: 250.0, ),
                  const SizedBox(height: 10.0),
                  Text(
                    centerText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    DescriptionText,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50.0),
                  // Go to the homepage button
                 CustomButton(text: S.of(context).goToHomepage, onPressed: () {
                 Navigator.pushNamedAndRemoveUntil(context, '/home-dashboard', (route) => false);

                 }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}