import 'package:cuer_app/features/admin_booking/cubit/admin_booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBookingActions extends StatelessWidget {
  final String orderId;

  const AdminBookingActions({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<AdminBookingCubit>().updateStatus(orderId, 'active');
          },
          child: const Text("قبول"),
        ),

        const SizedBox(width: 10),

        ElevatedButton(
          onPressed: () {
            context.read<AdminBookingCubit>().updateStatus(
              orderId,
              'history',
            );
          },
          child: const Text("تم التوصيل"),
        ),

        const SizedBox(width: 10),

        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            print("delete clicked");
            context.read<AdminBookingCubit>().deleteOrder(orderId);
          },
          child: const Text("حذف"),
        ),
      ],
    );
  }
}
