import 'package:flutter/material.dart';

class Asksignbutton extends StatelessWidget {
  final String placeholder1;
  final String placeholder2;
  final  void Function()? onPressed;

  const Asksignbutton({super.key, required this.placeholder1, required this.placeholder2,required this.onPressed});


  Widget build(BuildContext context) {
    return     TextButton(
                               onPressed: onPressed,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        placeholder1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        placeholder2,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
  }
}