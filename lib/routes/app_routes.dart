import 'package:demo/presentation/Homepage/home.dart';
import 'package:demo/presentation/LoignPage/loginPage.dart';
import 'package:demo/presentation/Reservepage/ReservationPage.dart';
import 'package:demo/presentation/SignUpPage/SignUppage.dart';
import 'package:demo/presentation/SuccessPage/SuccessPage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String initial = '/';
  static const String loginScreen = '/login-screen';
  static const String RegisterScreen = '/Signup-screen';
 // static const String SuccessScreen = '/Success-Page';
 static const String homeDashboard = '/home-dashboard';
 static const String reserveScreen = '/reserve-screen';


  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const LoginScreen(),
    loginScreen: (context) => const LoginScreen(),
    RegisterScreen: (context) => const SignupScreen(),
   // SuccessScreen: (context) => const SuccessPage(),
   homeDashboard: (context) =>  Home(),
    reserveScreen: (context) => const ReservationPage(),

  };
}