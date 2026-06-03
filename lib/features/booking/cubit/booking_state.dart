abstract class BookingState {}

class BookingInitial extends BookingState {}

class ServiceSelected extends BookingState {}

class DateSelected extends BookingState {}

class NotesAdded extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {}

class TimeSelected extends BookingState {}

class BookingError extends BookingState {
  final String message;

  BookingError(this.message);
}
