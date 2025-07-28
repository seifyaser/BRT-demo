import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo/Cubits/LanguageCubit/LanguageCubit.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        final isEnglish = locale.languageCode == 'en';

        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          ),
          onPressed: () {
            context.read<LanguageCubit>().setLanguage(isEnglish ? 'ar' : 'en');
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(isEnglish ? "العربية" : "English"),
              const SizedBox(width: 8),
              SvgPicture.asset(
                "assets/translate.svg",
                width: 24,
                height: 24,
                color: Colors.white, 
              ),
            ],
          ),
        );
      },
    );
  }
}
