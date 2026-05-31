import 'package:cuer_app/core/utils/password_utils.dart';
import 'package:cuer_app/core/utils/validation.dart';
import 'package:cuer_app/core/widgets/app_snackbar.dart';
import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/core/widgets/password_strength_indicator.dart';
import 'package:cuer_app/core/widgets/text_button.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:cuer_app/core/widgets/custom_textform_field.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:cuer_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const String pageID = "registerPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          AppSnackBar.show(context, "Account Created Successfully!");

          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginPage.pageID,
            (route) => false,
          );
        }

        if (state is AuthError) {
          AppSnackBar.show(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "welcome to cure",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const ImageTextStart(),
                      const SizedBox(height: 20),

                      const Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      CustomTextFormField(
                        hintText: "Email",
                        controller: emailController,
                        validator: Validation.email,
                      ),

                      const SizedBox(height: 16),

                      CustomTextFormField(
                        hintText: "Password",
                        controller: passwordController,
                        isPassword: true,
                        validator: PasswordUtils.validateStrong,
                        onChanged: (_) {
                          setState(() {});
                        },
                      ),

                      const SizedBox(height: 8),

                      PasswordStrengthIndicator(
                        password: passwordController.text,
                      ),

                      const SizedBox(height: 16),

                      CustomTextFormField(
                        hintText: "Confirm Password",
                        controller: confirmPasswordController,
                        isPassword: true,
                        validator: (value) => Validation.confirmPassword(
                          value,
                          passwordController.text,
                        ),
                      ),

                      const SizedBox(height: 24),

                      CustomButton(
                        buttonText: state is AuthLoading
                            ? "Loading..."
                            : "Sign Up",
                        onTap: state is AuthLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().register(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );
                                }
                              },
                      ),

                      const SizedBox(height: 16),

                      CustomTextButton(
                        buttonText: "Already have an account? Login",
                        routeName: LoginPage.pageID,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
