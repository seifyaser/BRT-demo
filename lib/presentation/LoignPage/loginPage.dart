import 'package:demo/presentation/SuccessPage/SuccessPage.dart';
import 'package:demo/widgets/AskSignbutton.dart';
import 'package:demo/presentation/LoignPage/widgets/Languagebutton.dart';
import 'package:demo/presentation/LoignPage/widgets/WelcomeText.dart';
import 'package:demo/presentation/LoignPage/widgets/rememberForgetRow.dart';
import 'package:demo/presentation/LoignPage/widgets/FormField.dart';
import 'package:demo/widgets/CustomButton.dart';
import 'package:demo/utils/validator.dart';
import 'package:demo/widgets/BackgroundImages.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool isLoading = false;
  bool obscurePassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundImages(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Form(
                key: _formKey,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Languagebutton(),

                              const Spacer(),
                              const WelcomeText(),
                              const SizedBox(height: 24),

                              CustomTextfield(
                                controller: emailController,
                                labelText: 'Email address',
                                hintText: 'Enter your email address',
                                keyboardType: TextInputType.emailAddress,
                                validator: Validators.validateEmail,
                              ),
                              const SizedBox(height: 16),

                              CustomTextfield(
                                controller: passwordController,
                                labelText: 'Password',
                                hintText: 'Enter your password',
                                obscureText: obscurePassword,
                                validator: Validators.validatePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),

                              RememberMeAndForgotRow(
                                rememberMe: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                },
                                onForgotPassword: () {
                                  // Go to forgot password
                                },
                              ),

                              const SizedBox(height: 16),

                              CustomButton(
                                text: 'Log in',
                                isLoading: isLoading,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() => isLoading = true);

                                    await Future.delayed(
                                      const Duration(seconds:2 ),
                                    );

                                    setState(() => isLoading = false);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const SuccessPage(
                                              centerText:
                                                  '🎉 Login successful!',
                                              DescriptionText:
                                                  'Welcome! Enjoy a seamless experience and special offers.',
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),

                              const SizedBox(height: 18),

                              Asksignbutton(
                                placeholder1: 'don\'t have an account? ',
                                placeholder2: 'Sign up now',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    '/Signup-screen',
                                  );
                                },
                              ),

                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
