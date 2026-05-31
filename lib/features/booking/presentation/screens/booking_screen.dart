import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/booking_state.dart';
import 'package:cuer_app/features/booking/presentation/screens/recent_booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/service_selector.dart';
import '../widgets/date_selector.dart';
import '../widgets/notes_input.dart';
import '../widgets/confirm_button.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});
  static const String pageID = "BookService";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingCubit(),
      child: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
          // ✅ Success case
          if (state is BookingSuccess) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text("Success 🎉"),
                content: const Text("Booking completed successfully"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          }

          // ❌ Error case
          if (state is BookingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },

        // UI
        child: Scaffold(
          appBar: AppBar(title: const Text("Book Service"),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
            context,
            MyBookingsScreen.pageID,
            (route) => false,
          );
              },
            )
          ],
          ),
          body: const Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ServiceSelector(),
                  SizedBox(height: 20),
                  DateSelector(),
                  SizedBox(height: 20),
                  NotesInput(),
                  SizedBox(height: 30),
                  ConfirmButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}