import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/features/booking/cubit/booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/booking_state.dart';
import 'package:cuer_app/features/booking/presentation/screens/recent_booking_screen.dart';
import 'package:cuer_app/features/booking/presentation/widgets/time_selector.dart';
import 'package:cuer_app/features/booking/repository/booking_repository.dart';
import 'package:cuer_app/features/profile/presentation/screens/profile_screen.dart';
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
      create: (_) => BookingCubit(BookingRepository()),
      child: BlocListener<BookingCubit, BookingState>(
        listener: (context, state) {
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

          if (state is BookingError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        child: Scaffold(
          appBar: AppBar(
            title: const Text("Book Service"),
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.textColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.history),
                onPressed: () {
                  Navigator.pushNamed(context, MyBookingsScreen.pageID);
                },
              ),

              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.pageID);
                },
              ),
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
                  Row(
                    children: [
                      Expanded(child: DateSelector()),
                      Divider(color: Colors.grey, endIndent: 20),
                      Expanded(child: TimeSelector()),
                    ],
                  ),
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
