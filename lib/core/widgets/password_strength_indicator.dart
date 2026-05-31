import 'package:flutter/material.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({
    super.key,
    required this.password,
  });

  double get strength {
    if (password.isEmpty) return 0;
    if (password.length < 6) return 0.3;
    if (password.length < 10) return 0.6;
    return 1;
  }

  String get label {
    if (password.isEmpty) return "Enter password";
    if (strength < 0.5) return "Weak password";
    if (strength < 0.8) return "Medium password";
    return "Strong password";
  }

  Color get color {
    if (strength < 0.5) return Colors.red;
    if (strength < 0.8) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: strength),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, _) {
            return LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[300],
              color: color,
              minHeight: 6,
            );
          },
        ),

        const SizedBox(height: 6),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Text(
            label,
            key: ValueKey(label),
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}