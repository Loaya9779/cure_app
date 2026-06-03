import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:cuer_app/features/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:cuer_app/features/complete_profile/cubit/complete_profile_state.dart';
import 'package:cuer_app/features/complete_profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  static const String pageID = "completeProfilePage";

  @override
  Widget build(BuildContext context) {
    return BlocListener<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) {
        if (state is ProfileCompleted) {
          Navigator.pushReplacementNamed(context, DashboardScreen.pageID);
        }

        if (state is ProfileError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Complete Profile"),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.textColor,
        ),
        body: const Padding(padding: EdgeInsets.all(16), child: ProfileForm()),
      ),
    );
  }
}
