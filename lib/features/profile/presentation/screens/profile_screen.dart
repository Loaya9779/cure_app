import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/features/auth/presentation/screens/login_screen.dart';
import 'package:cuer_app/features/profile/cubit/profile_cubit.dart';
import 'package:cuer_app/features/profile/cubit/profile_state.dart';
import 'package:cuer_app/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cuer_app/features/profile/presentation/widgets/edit_button.dart';
import 'package:cuer_app/features/profile/presentation/widgets/info_tile.dart';
import 'package:cuer_app/features/profile/presentation/widgets/loading_widget.dart';
import 'package:cuer_app/features/profile/presentation/widgets/logout_button.dart';
import 'package:cuer_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String pageID = "profilePage";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    final uid = FirebaseAuth.instance.currentUser!.uid;
    context.read<ProfileCubit>().getProfile(uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textColor,
      ),

      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const ProfileLoadingWidget();
          }

          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }

          if (state is ProfileLoaded) {
            final user = state.profile;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ProfileHeader(name: user.name),

                  const SizedBox(height: 20),

                  ProfileInfoTile(title: "Phone", value: user.phoneNumber),
                  ProfileInfoTile(title: "Address", value: user.address),
                  ProfileInfoTile(title: "Blood Type", value: user.bloodType),
                  ProfileInfoTile(
                    title: "Diseases",
                    value: user.chronicDiseases,
                  ),
                  ProfileInfoTile(title: "Notes", value: user.notes),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EditProfileButton(
                      onTap: () {
                        Navigator.pushNamed(context, EditProfileScreen.pageID);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LogoutButton(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginPage.pageID,
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
