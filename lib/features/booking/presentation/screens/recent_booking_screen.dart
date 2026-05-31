import 'package:cuer_app/features/booking/cubit/recent_booking_cubit.dart';
import 'package:cuer_app/features/booking/cubit/recent_booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  static const String pageID = "MyBookings";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingListCubit()..getBookings(),
      child: Scaffold(
        appBar: AppBar(title: const Text("My Bookings")),
        body: BlocBuilder<BookingListCubit, BookingListState>(
          builder: (context, state) {
            if (state is BookingListLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BookingListError) {
              return Center(child: Text(state.message));
            }

            if (state is BookingListSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.bookings.length,
                itemBuilder: (context, index) {
                  final booking = state.bookings[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(booking.service),
                      subtitle: Text(
                        "${booking.date.day}/${booking.date.month}/${booking.date.year}",
                      ),
                      trailing: _statusChip(booking.status),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _statusChip(String status) {
    Color color;

    switch (status) {
      case "Upcoming":
        color = Colors.orange;
        break;
      case "Completed":
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}