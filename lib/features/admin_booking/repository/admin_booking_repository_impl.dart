import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuer_app/features/admin_booking/repository/admin_booking_rebo.dart';
import '../model/admin_booking_model.dart';

class BookingRepositoryImpl implements AdminBookingRepository {
  final FirebaseFirestore firestore;

  BookingRepositoryImpl(this.firestore);

  @override
  Stream<List<AdminBookingModel>> getOrders() {
    return firestore.collection('bookings').snapshots().asyncMap((
      snapshot,
    ) async {
      List<AdminBookingModel> list = [];

      for (var doc in snapshot.docs) {
        final booking = doc.data();

        final String userId = booking['userId'] ?? '';

        final userQuery = await firestore
            .collection('users')
            .where('uid', isEqualTo: userId)
            .get();

        final user = userQuery.docs.isNotEmpty
            ? userQuery.docs.first.data()
            : {};

        list.add(
          AdminBookingModel(
            id: doc.id,

            serviceType: booking['service'] ?? '',
            date: booking['date'] ?? '',
            status: booking['status'] ?? 'upcoming',
            notes: booking['notes'] ?? '',

            userName: user['name'] ?? '',
            phone: user['phoneNumber'] ?? '',
            address: user['address'] ?? '',
            bloodType: user['bloodType'] ?? '',
            uid: userId,
            hasChronicDiseases: user['chronicDiseases'] ?? '',
          ),
        );
      }

      return list;
    });
  }

  @override
  Future<void> updateStatus(String id, String status) async {
    await firestore.collection('bookings').doc(id).update({'status': status});
  }

  @override
  Future<void> deleteOrder(String id) async {
    await firestore.collection('bookings').doc(id).delete();
  }
}
