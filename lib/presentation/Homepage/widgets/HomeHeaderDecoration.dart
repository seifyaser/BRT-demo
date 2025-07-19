import 'package:demo/presentation/Homepage/widgets/GreetingHeadline.dart';
import 'package:flutter/material.dart';

class HomeHeaderDecoration extends StatelessWidget {
  const HomeHeaderDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return                   Container(
                    width: double.infinity,
                    height: 330,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF427292), Color(0xFF3363FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 20,
                      right: 20,
                    ),
                    child: Greetingheadline(),
                  );
  }
}