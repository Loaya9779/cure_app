import 'package:cuer_app/core/utils/colors.dart';
import 'package:cuer_app/core/widgets/custom_button.dart';
import 'package:cuer_app/features/booking/presentation/screens/booking_screen.dart';
import 'package:cuer_app/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:cuer_app/features/dashboard/presentation/widgets/admin_action_button.dart';
import 'package:cuer_app/features/dashboard/presentation/widgets/dashboard_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  static const String pageID = "dashboard";
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    final userId = FirebaseAuth.instance.currentUser!.uid;
    context.read<DashboardCubit>().loadDashboard(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        foregroundColor: AppColors.textColor,
        actions: [AdminActionButton()],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome 👋",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                DashboardCard(
                  title: "Active Bookings",
                  count: state.active,
                  color: AppColors.dashboardCards[0],
                ),

                DashboardCard(
                  title: "Upcoming Visits",
                  count: state.upcoming,
                  color: AppColors.dashboardCards[1],
                ),

                DashboardCard(
                  title: "History",
                  count: state.history,
                  color: AppColors.dashboardCards[2],
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, BookingScreen.pageID);
                    },
                    child: const Text(
                      "Book New Service",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
