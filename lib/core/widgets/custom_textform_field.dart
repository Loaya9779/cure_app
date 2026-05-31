import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.validator,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    this.prefixIcon,
  });

  final Function(String)? onChanged;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Icon? prefixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? obscureText : false,

      decoration: InputDecoration(
        hintText: widget.hintText,

        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        filled: true,
      ),
    );
  }
}