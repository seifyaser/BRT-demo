class Validators {
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }
}
