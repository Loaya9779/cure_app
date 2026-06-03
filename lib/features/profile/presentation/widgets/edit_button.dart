import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onTap;

  const EditProfileButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        onTap: onTap,
        buttonText: "Edit Profile",
      ),
    );
  }
}