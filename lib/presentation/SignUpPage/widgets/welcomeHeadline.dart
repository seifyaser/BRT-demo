   import 'package:flutter/material.dart';

class WelcomeHeadline extends StatelessWidget {
Widget build(BuildContext context) {
  return   Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Let's get started! Create your account easily",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Enter your basic information to join us',
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              );
}
}