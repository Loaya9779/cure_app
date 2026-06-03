import 'package:cuer_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.buttonText,
    this.isLoading = false,
    this.textsize,
    this.height,
    this.weidth,
    this.child,
  });

  final double? height;
  final double? weidth;
  final double? textsize;
  final VoidCallback? onTap;
  final String? buttonText;
  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: weidth ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: isLoading
              ? Colors.grey
              : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : child ??
                  Text(
                    buttonText ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textsize ?? 16,
                      
                    ),
                  ),
        ),
      ),
    );
  }
}