import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final cubit = context.read<BookingCubit>();

        final selectedDate = cubit.selectedDate;


        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Date",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                selectedDate == null
                    ? "No date selected"
                    : "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              ),
            ),

            const SizedBox(height: 10),

            CustomButton(
              height: MediaQuery.of(context).size.height * 0.05,
              weidth: MediaQuery.of(context).size.width * 0.2,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
                );

                if (date != null) {
                  cubit.selectDate(date);
                }
              },
              buttonText:"Pick Date",
            ),

            const SizedBox(height: 10),

            
          
          ],
        );
      },
    );
  }
}