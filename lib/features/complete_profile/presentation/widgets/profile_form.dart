import 'package:cuer_app/features/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:cuer_app/features/profile/model/profile_model.dart';
import 'package:cuer_app/features/complete_profile/presentation/widgets/blood_type_dropdown.dart';
import 'package:cuer_app/features/complete_profile/presentation/widgets/profile_fields.dart';
import 'package:cuer_app/features/complete_profile/presentation/widgets/save_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final diseaseController = TextEditingController();
  final notesController = TextEditingController();

  String? bloodType;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    diseaseController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void submit() {
    if (!formKey.currentState!.validate()) return;

    if (bloodType == null) return;

    final uid = FirebaseAuth.instance.currentUser!.uid;

    final profile = ProfileModel(
      uid: uid,
      name: nameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      address: addressController.text.trim(),
      bloodType: bloodType!,
      chronicDiseases: diseaseController.text.trim(),
      notes: notesController.text.trim(),
    );

    context.read<CompleteProfileCubit>().saveProfile(profile);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileFields(
              nameController: nameController,
              phoneController: phoneController,
              addressController: addressController,
              diseaseController: diseaseController,
              notesController: notesController,
            ),

            const SizedBox(height: 16),

            BloodTypeDropdown(
              value: bloodType,
              onChanged: (val) => setState(() => bloodType = val),
            ),

            const SizedBox(height: 24),

            SaveButton(onTap: submit),
          ],
        ),
      ),
    );
  }
}