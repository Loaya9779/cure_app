import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/core/widgets/app_dialog.dart';
import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/core/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_state.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const String pageID = "forgotPasswordPage";

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          AppDialog.show(
            context,
            title: "Reset Email Sent",
            message: "Check your email inbox.",
          );
        }

        if (state is AuthError) {
          AppDialog.show(context, title: "Error", message: state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Scaffold(
          appBar: AppBar(title: const Text("Forgot Password"),
           backgroundColor: AppColors.primaryColor,),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.email),
                  controller: emailController,
                  hintText: "Enter your email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    buttonText: "Send Reset Email",
                    isLoading: isLoading,
                    onTap: () {
                      final email = emailController.text.trim();

                      if (email.isEmpty) {
                        AppDialog.show(
                          context,
                          title: "Error",
                          message: "Please enter your email",
                        );
                        return;
                      }

                      context.read<AuthCubit>().resetPassword(email);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
