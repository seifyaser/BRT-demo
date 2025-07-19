import 'package:demo/Cubits/SignUp/cubit/sign_up_cubit.dart';
import 'package:demo/generated/l10n.dart';
import 'package:demo/presentation/LoignPage/widgets/Languagebutton.dart';
import 'package:demo/presentation/SignUpPage/widgets/CustomFormBuilder.dart';
import 'package:demo/presentation/SignUpPage/widgets/welcomeHeadline.dart';
import 'package:demo/presentation/SuccessPage/SuccessPage.dart';
import 'package:demo/widgets/AskSignbutton.dart';
import 'package:demo/widgets/CustomButton.dart';
import 'package:demo/widgets/BackgroundImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<SignUpCubit, SignUpState>(
         listener: (context, state) {
         if (state is SignUpSuccess) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessPage(
          centerText: S.of(context).SuccessAcountSignupCenterText,
          DescriptionText: S.of(context).SuccessAcountSignupDescriptionText,
        ),
      ),
    );
  }
        else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
           content: Text(state.error),
             backgroundColor: Colors.red,
      ),
    );
  }
},
          builder: (context, state) {
           SignUpCubit cubit = context.read<SignUpCubit>();
            return Stack(
              fit: StackFit.expand,
              children: [
                BackgroundImages(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
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

                                    /// phone number
                                    CustomFormBuilderField(
                                      name: 'phone_number',
                                      label: S.of(context).phoneLabel,
                                      hint: S.of(context).phoneHint,
                                      keyboardType: TextInputType.phone,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(
                                          errorText: S.of(context).required,
                                        ),
                                        FormBuilderValidators.match(
                                          RegExp(r'^01[0-2,5]{1}[0-9]{8}$'),
                                          errorText:
                                              S.of(context).invalidphoneError,
                                        ),
                                      ]),
                                    ),
                                    const SizedBox(height: 16),

                                    /// password
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
                                          errorText: S
                                              .of(context)
                                              .passwordMinLengthError,
                                        ),
                                      ]),
                                    ),
                                    const SizedBox(height: 16),

                                    /// confirm password
                                    CustomFormBuilderField(
                                      name: 'confirm_password',
                                      label:
                                          S.of(context).confirmPasswordLabel,
                                      hint: S.of(context).confirmPasswordhint,
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
                                      validator: (val) {
                                        final password = _formKey
                                            .currentState
                                            ?.fields['password']
                                            ?.value;
                                        if (val == null || val.isEmpty) {
                                          return S.of(context).required;
                                        }
                                        if (val != password) {
                                          return S
                                              .of(context)
                                              .passwordMatchError;
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 16),

                                    /// Sign Up Button
                                    CustomButton(
                                      text: S.of(context).SignUpButton,
                                      isLoading: state is SignUpLoading,
                                      onPressed: () {
                                        if (_formKey.currentState!
                                            .saveAndValidate()) {
                                          final formData =
                                              _formKey.currentState!.value;
                                       cubit.registerWithPhoneNumber(formData);
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 16),

                                    /// Already have account
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
            );
          },
        ),
      ),
    );
  }
}
