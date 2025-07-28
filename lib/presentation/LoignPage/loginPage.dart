import 'package:demo/Cubits/SignIn/cubit/login_cubit.dart';
import 'package:demo/generated/l10n.dart';
import 'package:demo/presentation/SignUpPage/widgets/CustomFormBuilder.dart';
import 'package:demo/presentation/SuccessPage/SuccessPage.dart';
import 'package:demo/widgets/AskSignbutton.dart';
import 'package:demo/widgets/Languagebutton.dart';
import 'package:demo/presentation/LoignPage/widgets/WelcomeText.dart';
import 'package:demo/presentation/LoignPage/widgets/rememberForgetRow.dart';
import 'package:demo/widgets/CustomButton.dart';
import 'package:demo/widgets/BackgroundImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool rememberMe = false;
  bool isLoading = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SuccessPage(
                        centerText: S.of(context).SuccessAcountSignupCenterText,
                        DescriptionText:
                            S.of(context).SuccessAcountSignupDescriptionText,
                      ),
                ),
              );
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            LoginCubit cubit = context.read<LoginCubit>();
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
                    child: FormBuilder(
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
                                    LanguageButton(),
                                    const Spacer(),
                                    const WelcomeText(),
                                    const SizedBox(height: 24),

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
                                          errorText:
                                              S
                                                  .of(context)
                                                  .passwordMinLengthError,
                                        ),
                                      ]),
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
                                        // Forgot password logic
                                      },
                                    ),
                                    const SizedBox(height: 16),

                                    CustomButton(
                                      isLoading: state is LoginLoading,
                                      text: S.of(context).loginButton,
                                      onPressed: () {
                                        if (_formKey.currentState!
                                            .saveAndValidate()) {
                                          final formData =
                                              _formKey.currentState!.value;
                                          cubit.loginWithPhoneNumber(formData);
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 18),

                                    Asksignbutton(
                                      placeholder1: S.of(context).placeholder1,
                                      placeholder2: S.of(context).placeholder2,
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
            );
          },
        ),
      ),
    );
  }
}
