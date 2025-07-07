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
        const Text(
          'Remember me',
          style: TextStyle(color: Colors.white),
        ),
        const Spacer(),
        TextButton(
          onPressed: onForgotPassword,
          child: const Text(
            'Forgot your password?',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
