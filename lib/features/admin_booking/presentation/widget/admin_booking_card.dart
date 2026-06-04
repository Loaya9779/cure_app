import 'package:cuer_app/features/admin_booking/model/admin_booking_model.dart';
import 'package:cuer_app/features/admin_booking/presentation/widget/admin_booking_action.dart';
import 'package:flutter/material.dart';

class AdminBookingCard extends StatelessWidget {
  final AdminBookingModel order;

  const AdminBookingCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("👤 ${order.userName}"),
            Text("📞 ${order.phone}"),
            Text("📍 ${order.address}"),
            Text("📅 ${order.date}"),
            Text("📝 ${order.notes}"),
            Text("🩺 ${order.serviceType}"),
            const SizedBox(height: 10),

            Text(
              "📦 ${order.status}",
              style: TextStyle(
                color: order.status == 'pending'
                    ? Colors.orange
                    : order.status == 'accepted'
                    ? Colors.blue
                    : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            AdminBookingActions(orderId: order.id),
          ],
        ),
      ),
    );
  }
}
