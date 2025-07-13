import 'package:demo/generated/l10n.dart';
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
                                      label: S.of(context).firstNamelabel,
                                      hint: S.of(context).firstNamelabel,
                                      validator: FormBuilderValidators.required(
                                        errorText: S.of(context).required,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomFormBuilderField(
                                      name: 'last_name',
                                      label: S.of(context).lastNamelabel,
                                      hint: S.of(context).lastNamelabel,
                                      validator: FormBuilderValidators.required(
                                        errorText: S.of(context).required,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Email
                              CustomFormBuilderField(
                                name: 'email',
                                label: S.of(context).emailLabel,
                                hint: S.of(context).emailHint,
                                keyboardType: TextInputType.emailAddress,
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: S.of(context).required,
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: S.of(context).invalidEmailError,
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 16),

                              // Password
                              CustomFormBuilderField(
                                name: 'password',
                                label: S.of(context).passwordLabel,
                                hint: S.of(context).passwordHint,
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
                                    errorText: S.of(context).required,
                                  ),
                                  FormBuilderValidators.minLength(
                                    6,
                                    errorText: S.of(context).passwordMinLengthError,
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 16),

                              // Gender Dropdown
                              CustomDropdownField<String>(
                                items:  [
                                  DropdownMenuItem(
                                    value: 'Male',
                                    child: Text(S.of(context).male),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Female',
                                    child: Text(S.of(context).female),
                                  ),
                                ],
                                validator: FormBuilderValidators.required(
                                  errorText: S.of(context).pleaseSelectYourGender,
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
                                text: S.of(context).SignUpButton,
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
                                            (context) =>  SuccessPage(
                                              centerText:
                                                  S.of(context).SuccessAcountSignupCenterText,
                                              DescriptionText:
                                                  S.of(context).SuccessAcountSignupDescriptionText,
                                            ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              const SizedBox(height: 16),

                              // Already have account
                              Asksignbutton(
                                placeholder1: S.of(context).placeholder3,
                                placeholder2: S.of(context).placeholder4,
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
