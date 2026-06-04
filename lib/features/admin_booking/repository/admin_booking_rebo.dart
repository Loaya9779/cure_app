import '../model/admin_booking_model.dart';

abstract class AdminBookingRepository {
  Stream<List<AdminBookingModel>> getOrders();
  Future<void> updateStatus(String id, String status);
  Future<void> deleteOrder(String id);
}