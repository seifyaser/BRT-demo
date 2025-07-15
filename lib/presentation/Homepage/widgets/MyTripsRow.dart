import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class Mytripsrow extends StatelessWidget {
  Widget build(BuildContext context) {
    return     Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 181, 181, 181),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).MyTrips,
                            style: const TextStyle(
                              color: Color(0xFF427292),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/reserve-screen');
                            },
                            child: Text(
                              S.of(context).showAll,
                              style: const TextStyle(
                                color: Color(0xFF427292),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
  }
}