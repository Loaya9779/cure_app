import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/core/widgets/custom_textform_field.dart';
import 'package:cuer_app/features/profile/cubit/profile_cubit.dart';
import 'package:cuer_app/features/profile/cubit/profile_state.dart';
import 'package:cuer_app/features/profile/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static const String pageID = "editProfilePage";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final diseaseController = TextEditingController();
  final notesController = TextEditingController();

  String? bloodType;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    final state = context.read<ProfileCubit>().state;

    if (state is ProfileLoaded) {
      final user = state.profile;

      nameController.text = user.name;
      phoneController.text = user.phoneNumber;
      addressController.text = user.address;
      diseaseController.text = user.chronicDiseases;
      notesController.text = user.notes;
      bloodType = user.bloodType;
    }
  }

  void update() {
    final uid = context.read<ProfileCubit>().state is ProfileLoaded
        ? (context.read<ProfileCubit>().state as ProfileLoaded).profile.uid
        : "";

    final updatedProfile = ProfileModel(
      uid: uid,
      name: nameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      address: addressController.text.trim(),
      bloodType: bloodType ?? "",
      chronicDiseases: diseaseController.text.trim(),
      notes: notesController.text.trim(),
    );

    context.read<ProfileCubit>().updateProfile(updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile"),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textColor,
      ),

      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoaded || state is ProfileCompleted) {
            Navigator.pop(context, true);
          }

          if (state is ProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomTextFormField(controller: nameController, hintText: "Name"),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: phoneController,
                hintText: "Phone",
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: addressController,
                hintText: "Address",
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: diseaseController,
                hintText: "Diseases",
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: notesController,
                hintText: "Notes",
              ),

              const SizedBox(height: 20),

              CustomButton(onTap: update, buttonText: "Save Changes"),
            ],
          ),
        ),
      ),
    );
  }
}
