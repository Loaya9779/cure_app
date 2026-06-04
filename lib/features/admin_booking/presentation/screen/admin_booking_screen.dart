import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/features/admin_booking/cubit/admin_booking_cubit.dart';
import 'package:cuer_app/features/admin_booking/cubit/admin_booking_state.dart';
import 'package:cuer_app/features/admin_booking/presentation/widget/admin_booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminBookingScreen extends StatefulWidget {
  const AdminBookingScreen({super.key});
  static const String pageID = "adminBookingPage";

  @override
  State<AdminBookingScreen> createState() => _AdminBookingPageState();
}

class _AdminBookingPageState extends State<AdminBookingScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdminBookingCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.textColor,
      ),
      body: BlocBuilder<AdminBookingCubit, AdminBookingState>(
        builder: (context, state) {
          if (state is BookingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is BookingLoaded) {
            return ListView.builder(
              itemCount: state.bookings.length,
              itemBuilder: (context, index) {
                return AdminBookingCard(order: state.bookings[index]);
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
