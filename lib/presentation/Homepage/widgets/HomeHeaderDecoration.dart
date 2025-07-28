import 'package:demo/Cubits/LanguageCubit/LanguageCubit.dart';
import 'package:demo/presentation/Homepage/widgets/GreetingHeadline.dart';
import 'package:demo/widgets/Languagebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeaderDecoration extends StatelessWidget {
  const HomeHeaderDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context), // أو حسب لغة التطبيق
      child: Stack(
        children: [
          // ✅ خلفية الهيدر
          Container(
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
          ),

          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
              child: LanguageButton(),
            ),
          ),
        ],
      ),
    );
  }
}
