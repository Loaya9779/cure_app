import 'package:cuer_app/features/booking/model/booking_model.dart';

abstract class BookingListState {}

class BookingListInitial extends BookingListState {}

class BookingListLoading extends BookingListState {}

class BookingListSuccess extends BookingListState {
  final List<BookingModel> bookings;
  BookingListSuccess(this.bookings);
}

class BookingListError extends BookingListState {
  final String message;
  BookingListError(this.message);
}