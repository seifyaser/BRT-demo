import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Languagebutton extends StatelessWidget {
  Widget build(BuildContext context) {
    return      Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      foregroundColor: Colors.white,
                                      side: const BorderSide(color: Colors.white),
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text("العربية"),
                                        const SizedBox(width: 8),
                                        SvgPicture.asset(
                                          "assets/translate.svg",
                                          width: 24,
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
  }
}