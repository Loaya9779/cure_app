import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceSelector extends StatelessWidget {
  const ServiceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final services = ["Nurse Visit", "Injection", "Elderly Care"];

    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final cubit = context.read<BookingCubit>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: services.map((service) {
                final isSelected = cubit.selectedService == service;

                return ChoiceChip(
                  label: Text(service),
                  selected: isSelected,
                  onSelected: (_) {
                    cubit.selectService(service);
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}