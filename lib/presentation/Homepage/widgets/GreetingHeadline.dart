import 'package:flutter/material.dart';

class Greetingheadline extends StatelessWidget {
  Widget build(BuildContext context) {
    return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Morning Dear,', style: TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(height: 5),
                        Text(
                          'Where Are You\nGoing Today?',
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                  ],
                );
  }
}