   import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class WelcomeHeadline extends StatelessWidget {
Widget build(BuildContext context) {
  return   Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text(
                                    S.of(context).letsGetStartedCreateAccount,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                   Text(
                                    S.of(context).enterYourBasicInformationToJoinUs,
                                    style: TextStyle(color: Color(0xffFFFFFF), fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              );
}
}