import 'package:cuer_app/features/booking/presentation/screens/booking_screen.dart';
import 'package:cuer_app/features/dashboard/model/dashboard_model.dart';
import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  static const String pageID = "dashboard";

  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome 👋,",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Cards
            ...DashboardItemModel.dashboardItems.map(
              (item) => DashboardCard(
                title: item.title,
                count: item.count,
                color: item.color,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    BookingScreen.pageID,
                    (route) => false,
                  );
                },
                child: const Text("Book New Service"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
