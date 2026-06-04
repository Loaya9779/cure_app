import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cuer_app/features/admin_booking/presentation/screen/admin_booking_screen.dart';

class AdminActionButton extends StatelessWidget {
  const AdminActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final isAdmin = data['rule'] == "admin";

        if (!isAdmin) return const SizedBox();

        return IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminBookingScreen(),
              ),
            );
          },
          icon: const Icon(Icons.admin_panel_settings),
        );
      },
    );
  }
}