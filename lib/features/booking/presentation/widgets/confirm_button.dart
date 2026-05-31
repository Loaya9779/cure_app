import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final isLoading = state is BookingLoading;

        return SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    cubit.confirmBooking();
                  },
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Confirm Booking"),
          ),
        );
      },
    );
  }
}