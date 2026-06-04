import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        buttonColor: Colors.red,
        onTap: onTap,
        buttonText: "Logout",
      ),
    );
  }
}