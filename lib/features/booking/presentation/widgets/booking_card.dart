import 'package:cuer_app/features/booking/model/booking_model.dart';
import 'package:flutter/material.dart';

class BookingCard extends StatelessWidget {
  final BookingModel booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading: const Icon(Icons.event_note, color: Colors.blue),

        title: Text(
          booking.service,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text("Date: ${booking.date.toLocal()}"),
            if (booking.notes != null)
              Text("Notes: ${booking.notes}"),
          ],
        ),

        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}