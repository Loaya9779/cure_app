import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/booking_model.dart';

class BookingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createBooking(BookingModel booking) async {
    await _firestore.collection("bookings").add(booking.toJson());
  }

  Stream<List<BookingModel>> getUserBookings(String uid) {
    return _firestore
        .collection("bookings")
        .where("userId", isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return BookingModel.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<List<BookingModel>> getUserBookingsOnce(String uid) async {
  final snapshot = await FirebaseFirestore.instance
      .collection("bookings")
      .where("userId", isEqualTo: uid)
      .get();

  return snapshot.docs.map((doc) {
    return BookingModel.fromJson(doc.data(), doc.id);
  }).toList();
}
}