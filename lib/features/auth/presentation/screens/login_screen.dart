import 'package:cuer_app/core/utils/validation.dart';
import 'package:cuer_app/core/widgets/app_snackbar.dart';
import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/core/widgets/custom_textform_field.dart';
import 'package:cuer_app/core/widgets/text_button.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:cuer_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:cuer_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:cuer_app/features/auth/presentation/screens/register_screen.dart';
import 'package:cuer_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String pageID = "loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          AppSnackBar.show(context, "Login Success");

          Navigator.pushNamedAndRemoveUntil(
            context,
            DashboardScreen.pageID,
            (route) => false,
          );
        }

        if (state is AuthError) {
          AppSnackBar.show(context, state.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

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
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const ImageTextStart(),
                      const SizedBox(height: 20),

                      const Text(
                        "LOGIN",
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
                        validator: Validation.password,
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        buttonText: isLoading ? "Loading..." : "Login",
                        onTap: isLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                  );
                                }
                              },
                      ),

                      const SizedBox(height: 16),

                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          buttonText: "Forgot Password?",
                          routeName: ForgotPasswordScreen.pageID,
                          textColor: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomTextButton(
                        buttonText: "Create new account",
                        routeName: RegisterPage.pageID,
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
