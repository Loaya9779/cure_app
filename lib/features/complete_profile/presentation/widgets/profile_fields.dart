import 'package:cuer_app/core/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class ProfileFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController diseaseController;
  final TextEditingController notesController;

  const ProfileFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.addressController,
    required this.diseaseController,
    required this.notesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: "Full Name",
          controller: nameController,
          validator: (v) => v!.isEmpty ? "Required" : null,
        ),
        const SizedBox(height: 12),

        CustomTextFormField(
          hintText: "Phone Number",
          controller: phoneController,
          keyboardType: TextInputType.phone,
          validator: (v) =>
              v!.length < 10 ? "Invalid phone" : null,
        ),
        const SizedBox(height: 12),

        CustomTextFormField(
          hintText: "Address",
          controller: addressController,
          validator: (v) => v!.isEmpty ? "Required" : null,
        ),
        const SizedBox(height: 12),

        CustomTextFormField(
          hintText: "Chronic Diseases",
          controller: diseaseController,
        ),
        const SizedBox(height: 12),

        CustomTextFormField(
          hintText: "Notes",
          controller: notesController,
        ),
      ],
    );
  }
}