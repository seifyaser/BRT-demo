import 'package:demo/Cubits/LanguageCubit/LanguageCubit.dart';
import 'package:demo/generated/l10n.dart';
import 'package:demo/models/TransactionDetailsModel.dart';
import 'package:demo/presentation/Homepage/home.dart';
import 'package:demo/presentation/LoignPage/loginPage.dart';
import 'package:demo/presentation/Reservepage/ReservationPage.dart';
import 'package:demo/presentation/SignUpPage/SignUppage.dart';
import 'package:demo/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => LanguageCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: locale,

          // Localization setup
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,

          // Initial screen
          initialRoute: AppRoutes.initial,

          // Navigation logic
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case AppRoutes.initial:
              case AppRoutes.loginScreen:
                return MaterialPageRoute(builder: (_) => const LoginScreen());

              case AppRoutes.registerScreen:
                return MaterialPageRoute(builder: (_) => const SignupScreen());

              case AppRoutes.homeDashboard:
                return MaterialPageRoute(builder: (_) => Home());

              case AppRoutes.reserveScreen:
                final tickets = settings.arguments as List<TransactionDetailModel>;
                return MaterialPageRoute(
                  builder: (_) => ReservationPage(tickets: tickets),
                );

              default:
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(
                    body: Center(child: Text("404 - Route Not Found")),
                  ),
                );
            }
          },
        );
      },
    );
  }
}

