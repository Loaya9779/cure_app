import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/features/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:cuer_app/features/complete_profile/cubit/complete_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onTap;

  const SaveButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        final isLoading = state is ProfileLoading;

        return CustomButton(
          buttonText: isLoading ? "Saving..." : "Save Profile",
          onTap: isLoading ? null : onTap,
        );
      },
    );
  }
}