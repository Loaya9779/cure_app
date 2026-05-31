class PasswordUtils {
  static String? validateStrong(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Add at least one uppercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Add at least one number";
    }

    return null;
  }
}