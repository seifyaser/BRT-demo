// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login With Mobile`
  String get loginWithMobile {
    return Intl.message(
      'Login With Mobile',
      name: 'loginWithMobile',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password`
  String get enterEmailAndPasswordInstruction {
    return Intl.message(
      'Enter your email and password',
      name: 'enterEmailAndPasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enterYourEmailAddress {
    return Intl.message(
      'Enter your email address',
      name: 'enterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Email address`
  String get labelEmailText {
    return Intl.message(
      'Email address',
      name: 'labelEmailText',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get hintEmailText {
    return Intl.message(
      'Enter your email address',
      name: 'hintEmailText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get labelPasswordText {
    return Intl.message(
      'Password',
      name: 'labelPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get hintPasswordText {
    return Intl.message(
      'Enter your password',
      name: 'hintPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forget your Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget your Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get placeholder1 {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'placeholder1',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up now`
  String get placeholder2 {
    return Intl.message(
      'Sign Up now',
      name: 'placeholder2',
      desc: '',
      args: [],
    );
  }

  /// `The password entered is incorrect`
  String get incorrectPasswordError {
    return Intl.message(
      'The password entered is incorrect',
      name: 'incorrectPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginSuccessful {
    return Intl.message(
      'Login successful!',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and password to enjoy the experience.`
  String get enjoySmartPowerfulExperience {
    return Intl.message(
      'Enter your email and password to enjoy the experience.',
      name: 'enjoySmartPowerfulExperience',
      desc: '',
      args: [],
    );
  }

  /// `Go to the homepage`
  String get goToHomepage {
    return Intl.message(
      'Go to the homepage',
      name: 'goToHomepage',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message('Required', name: 'required', desc: '', args: []);
  }

  /// `Let's get started! Create your account easily`
  String get letsGetStartedCreateAccount {
    return Intl.message(
      'Let\'s get started! Create your account easily',
      name: 'letsGetStartedCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter your basic information to join us`
  String get enterYourBasicInformationToJoinUs {
    return Intl.message(
      'Enter your basic information to join us',
      name: 'enterYourBasicInformationToJoinUs',
      desc: '',
      args: [],
    );
  }

  /// `first name`
  String get firstNamelabel {
    return Intl.message(
      'first name',
      name: 'firstNamelabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter First Name`
  String get firstNamehint {
    return Intl.message(
      'Enter First Name',
      name: 'firstNamehint',
      desc: '',
      args: [],
    );
  }

  /// `last name`
  String get lastNamelabel {
    return Intl.message('last name', name: 'lastNamelabel', desc: '', args: []);
  }

  /// `Enter Last Name`
  String get lastNamehint {
    return Intl.message(
      'Enter Last Name',
      name: 'lastNamehint',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phoneLabel {
    return Intl.message('phone number', name: 'phoneLabel', desc: '', args: []);
  }

  /// `Enter phone number`
  String get phoneHint {
    return Intl.message(
      'Enter phone number',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter password`
  String get passwordHint {
    return Intl.message(
      'Enter password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message('Password', name: 'passwordLabel', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Select Gender`
  String get genderSelect {
    return Intl.message(
      'Select Gender',
      name: 'genderSelect',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get dateSelect {
    return Intl.message('Select Date', name: 'dateSelect', desc: '', args: []);
  }

  /// `Date of birth`
  String get datebirthlabel {
    return Intl.message(
      'Date of birth',
      name: 'datebirthlabel',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Sign Up`
  String get SignUpButton {
    return Intl.message('Sign Up', name: 'SignUpButton', desc: '', args: []);
  }

  /// `Already have an account? `
  String get placeholder3 {
    return Intl.message(
      'Already have an account? ',
      name: 'placeholder3',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get placeholder4 {
    return Intl.message('Sign In', name: 'placeholder4', desc: '', args: []);
  }

  /// `The phone you entered is invalid`
  String get invalidphoneError {
    return Intl.message(
      'The phone you entered is invalid',
      name: 'invalidphoneError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter Confirm Password`
  String get confirmPasswordhint {
    return Intl.message(
      'Enter Confirm Password',
      name: 'confirmPasswordhint',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordMatchError {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordMatchError',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 6 characters`
  String get passwordMinLengthError {
    return Intl.message(
      'Minimum 6 characters',
      name: 'passwordMinLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please select date`
  String get pleaseSelectDate {
    return Intl.message(
      'Please select date',
      name: 'pleaseSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get pleaseEnterYourName {
    return Intl.message(
      'Please enter your name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please select your gender`
  String get pleaseSelectYourGender {
    return Intl.message(
      'Please select your gender',
      name: 'pleaseSelectYourGender',
      desc: '',
      args: [],
    );
  }

  /// `🎊 Your account has been successfully created!`
  String get SuccessAcountSignupCenterText {
    return Intl.message(
      '🎊 Your account has been successfully created!',
      name: 'SuccessAcountSignupCenterText',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! Your account has been successfully registered, and you can now browse the latest offers and products.`
  String get SuccessAcountSignupDescriptionText {
    return Intl.message(
      'Welcome! Your account has been successfully registered, and you can now browse the latest offers and products.',
      name: 'SuccessAcountSignupDescriptionText',
      desc: '',
      args: [],
    );
  }

  /// `🎉 Login successful!`
  String get SuccessAcountSignInCenterText {
    return Intl.message(
      '🎉 Login successful!',
      name: 'SuccessAcountSignInCenterText',
      desc: '',
      args: [],
    );
  }

  /// `Welcome! Enjoy a seamless experience and special offers.`
  String get SuccessAcountSignInDescriptionText {
    return Intl.message(
      'Welcome! Enjoy a seamless experience and special offers.',
      name: 'SuccessAcountSignInDescriptionText',
      desc: '',
      args: [],
    );
  }

  /// `The email you entered is invalid`
  String get invalidEmailError {
    return Intl.message(
      'The email you entered is invalid',
      name: 'invalidEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Morning Dear,`
  String get morningDear {
    return Intl.message(
      'Morning Dear,',
      name: 'morningDear',
      desc: '',
      args: [],
    );
  }

  /// `Where Are You\nGoing Today?`
  String get whereAreYouGoingToday {
    return Intl.message(
      'Where Are You\nGoing Today?',
      name: 'whereAreYouGoingToday',
      desc: '',
      args: [],
    );
  }

  /// `Available lines`
  String get availableLines {
    return Intl.message(
      'Available lines',
      name: 'availableLines',
      desc: '',
      args: [],
    );
  }

  /// `select a location`
  String get SelectLocationerror {
    return Intl.message(
      'select a location',
      name: 'SelectLocationerror',
      desc: '',
      args: [],
    );
  }

  /// `Please enter ticket count`
  String get pleaseeneterTicketCount {
    return Intl.message(
      'Please enter ticket count',
      name: 'pleaseeneterTicketCount',
      desc: '',
      args: [],
    );
  }

  /// `Al Qalyubia`
  String get alQalyubia {
    return Intl.message('Al Qalyubia', name: 'alQalyubia', desc: '', args: []);
  }

  /// `Giza`
  String get giza {
    return Intl.message('Giza', name: 'giza', desc: '', args: []);
  }

  /// `Cairo`
  String get cairo {
    return Intl.message('Cairo', name: 'cairo', desc: '', args: []);
  }

  /// `Please enter reserve date`
  String get pleaseeneterReserveDate {
    return Intl.message(
      'Please enter reserve date',
      name: 'pleaseeneterReserveDate',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get fromLabel {
    return Intl.message('From', name: 'fromLabel', desc: '', args: []);
  }

  /// `Maadi`
  String get maadiLocation {
    return Intl.message('Maadi', name: 'maadiLocation', desc: '', args: []);
  }

  /// `To`
  String get toLabel {
    return Intl.message('To', name: 'toLabel', desc: '', args: []);
  }

  /// `Gesr El Suez`
  String get gesrElSuezLocation {
    return Intl.message(
      'Gesr El Suez',
      name: 'gesrElSuezLocation',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Count`
  String get ticketCount {
    return Intl.message(
      'Ticket Count',
      name: 'ticketCount',
      desc: '',
      args: [],
    );
  }

  /// `example : 1`
  String get ticketCountExample {
    return Intl.message(
      'example : 1',
      name: 'ticketCountExample',
      desc: '',
      args: [],
    );
  }

  /// `Reserve date`
  String get reserveDate {
    return Intl.message(
      'Reserve date',
      name: 'reserveDate',
      desc: '',
      args: [],
    );
  }

  /// `example : 16, Jan 2023`
  String get reserveDateExample {
    return Intl.message(
      'example : 16, Jan 2023',
      name: 'reserveDateExample',
      desc: '',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: '',
      args: [],
    );
  }

  /// `Fawry Method`
  String get fawryMethod {
    return Intl.message(
      'Fawry Method',
      name: 'fawryMethod',
      desc: '',
      args: [],
    );
  }

  /// `Expected Price`
  String get expectedPrice {
    return Intl.message(
      'Expected Price',
      name: 'expectedPrice',
      desc: '',
      args: [],
    );
  }

  /// `150 EGP`
  String get priceValue {
    return Intl.message('150 EGP', name: 'priceValue', desc: '', args: []);
  }

  /// `Search`
  String get findTransportationButton {
    return Intl.message(
      'Search',
      name: 'findTransportationButton',
      desc: '',
      args: [],
    );
  }

  /// `My Trips`
  String get MyTrips {
    return Intl.message('My Trips', name: 'MyTrips', desc: '', args: []);
  }

  /// `Show All`
  String get showAll {
    return Intl.message('Show All', name: 'showAll', desc: '', args: []);
  }

  /// `Departure`
  String get departure {
    return Intl.message('Departure', name: 'departure', desc: '', args: []);
  }

  /// `Distance`
  String get Distance {
    return Intl.message('Distance', name: 'Distance', desc: '', args: []);
  }

  /// `Arrival`
  String get arrival {
    return Intl.message('Arrival', name: 'arrival', desc: '', args: []);
  }

  /// `View Details`
  String get ViewDetails {
    return Intl.message(
      'View Details',
      name: 'ViewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Price`
  String get TicketPrice {
    return Intl.message(
      'Ticket Price',
      name: 'TicketPrice',
      desc: '',
      args: [],
    );
  }

  /// `Ticket`
  String get TicketNo {
    return Intl.message('Ticket', name: 'TicketNo', desc: '', args: []);
  }

  /// `No. Ticket`
  String get NoOfTickets {
    return Intl.message('No. Ticket', name: 'NoOfTickets', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Ticket Reservation`
  String get TicketReservation {
    return Intl.message(
      'Ticket Reservation',
      name: 'TicketReservation',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
