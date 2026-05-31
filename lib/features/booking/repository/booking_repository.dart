import '../model/booking_model.dart';

class BookingRepository {
  Future<List<BookingModel>> getBookings() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      BookingModel(
        service: "Nurse Visit",
        date: DateTime.now().add(const Duration(days: 2)),
        status: "Upcoming",
      ),
      BookingModel(
        service: "Injection",
        date: DateTime.now().subtract(const Duration(days: 1)),
        status: "Completed",
      ),
    ];
  }
}