import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/features/booking/model/booking_model.dart';
import 'package:cuer_app/features/booking/presentation/widgets/booking_card.dart';
import 'package:cuer_app/features/booking/repository/booking_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  static const String pageID = "myBookingsPage";

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final repo = BookingRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textColor,
      ),

      body: StreamBuilder<List<BookingModel>>(
        stream: repo.getUserBookings(uid),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error loading bookings"));
          }

          final bookings = snapshot.data ?? [];

          if (bookings.isEmpty) {
            return const Center(child: Text("No bookings yet"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final booking = bookings[index];

              return BookingCard(booking: booking);
            },
          );
        },
      ),
    );
  }
}
