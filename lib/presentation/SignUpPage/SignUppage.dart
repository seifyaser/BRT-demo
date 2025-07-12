import 'package:demo/presentation/LoignPage/widgets/Languagebutton.dart';
import 'package:demo/presentation/SignUpPage/widgets/CustomFormBuilder.dart';
import 'package:demo/presentation/SignUpPage/widgets/DatebirthField.dart';
import 'package:demo/presentation/SignUpPage/widgets/genderDropdown.dart';
import 'package:demo/presentation/SignUpPage/widgets/welcomeHeadline.dart';
import 'package:demo/presentation/SuccessPage/SuccessPage.dart';
import 'package:demo/widgets/AskSignbutton.dart';
import 'package:demo/widgets/CustomButton.dart';
import 'package:demo/widgets/BackgroundImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool obscurePassword = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundImages(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                        child: FormBuilder(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Languagebutton(),
                              SizedBox(height: mediaHeight * 0.1),

                              const Spacer(),
                              WelcomeHeadline(),
                              const SizedBox(height: 24),

                              // First and Last Name
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomFormBuilderField(
                                      name: 'first_name',
                                      label: 'First name',
                                      hint: 'Enter first name',
                                      validator: FormBuilderValidators.required(
                                        errorText: 'Required',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomFormBuilderField(
                                      name: 'last_name',
                                      label: 'Last name',
                                      hint: 'Enter last name',
                                      validator: FormBuilderValidators.required(
                                        errorText: 'Required',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Email
                              CustomFormBuilderField(
                                name: 'email',
                                label: 'Email',
                                hint: 'Enter email',
                                keyboardType: TextInputType.emailAddress,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Required',
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: 'Invalid email',
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 16),

                              // Password
                              CustomFormBuilderField(
                                name: 'password',
                                label: 'Password',
                                hint: 'Enter password',
                                obscureText: obscurePassword,
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
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Required',
                                  ),
                                  FormBuilderValidators.minLength(
                                    6,
                                    errorText: 'Minimum 6 characters',
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 16),

                              // Gender Dropdown
                              CustomDropdownField<String>(
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Male',
                                    child: Text('Male'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text('Female'),
                                  ),
                                ],
                                validator: FormBuilderValidators.required(
                                  errorText: 'Please select a gender',
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Date of Birth Picker
                              const DateField(
                                name: 'date_of_birth',
                              ),
                              const SizedBox(height: 32),

                              // Sign Up Button
                              CustomButton(
                                text: 'Sign Up',
                                isLoading: isLoading,
                                onPressed: () async {
                                  if (_formKey.currentState!
                                      .saveAndValidate()) {
                                    setState(() => isLoading = true);

                                    await Future.delayed(
                                      const Duration(seconds: 2),
                                    );

                                    setState(() => isLoading = false);

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const SuccessPage(
                                              centerText:
                                                  '🎊 Your account has been successfully created!',
                                              DescriptionText:
                                                  'Welcome! Your account has been successfully registered, and you can now browse the latest offers and products.',
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 16),

                              // Already have account
                              Asksignbutton(
                                placeholder1: 'Already have an account? ',
                                placeholder2: 'Sign in',
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/login-screen",
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
