import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String routeName;
  final String buttonText;
  final Color? textColor;
  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.routeName,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: TextButton.styleFrom(
        foregroundColor: textColor,
      ),
      child:  Text(buttonText),
    );
  }
}
