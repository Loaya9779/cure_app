import 'package:cuer_app/core/widgets/custom_textform_field.dart';
import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesInput extends StatelessWidget {
  const NotesInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notes",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        CustomTextFormField(
          onChanged: (value) {
            cubit.addNotes(value);
          },
          hintText: "Any specific instructions or details?",
        ),
      ],
    );
  }
}