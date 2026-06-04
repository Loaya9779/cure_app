import '../model/admin_booking_model.dart';

abstract class AdminBookingState {}

class BookingInitial extends AdminBookingState {}

class BookingLoading extends AdminBookingState {}

class BookingLoaded extends AdminBookingState {
  final List<AdminBookingModel> bookings;

  BookingLoaded(this.bookings);
}

class BookingError extends AdminBookingState {
  final String message;

  BookingError(this.message);
}