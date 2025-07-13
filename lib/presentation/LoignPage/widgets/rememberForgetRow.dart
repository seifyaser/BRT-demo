import 'package:demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class RememberMeAndForgotRow extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgotPassword;

  const RememberMeAndForgotRow({
    super.key,
    required this.rememberMe,
    required this.onChanged,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: rememberMe,
          activeColor: Colors.blue,
          checkColor: Colors.white,
          onChanged: onChanged,
        ),
         Text(
          S.of(context).rememberMe,
          style: TextStyle(color: Colors.white),
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotPassword,
          child:  Text(
           S.of(context).forgetPassword,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
