import 'package:bloc/bloc.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  String? selectedService;
  DateTime? selectedDate;
  String? notes;

  // =====================
  // Select Service
  // =====================
  void selectService(String service) {
    selectedService = service;
    emit(ServiceSelected());
  }

  // =====================
  // Select Date
  // =====================
  void selectDate(DateTime date) {
    selectedDate = date;
    emit(DateSelected());
  }

  // =====================
  // Add Notes
  // =====================
  void addNotes(String value) {
    notes = value;
    emit(NotesAdded());
  }

  // =====================
  // Validation (IMPORTANT)
  // =====================
  bool canConfirmBooking() {
    return selectedService != null && selectedDate != null;
  }

  // =====================
  // Confirm Booking
  // =====================
  Future<void> confirmBooking() async {
    // ❗ validation before API
    if (!canConfirmBooking()) {
      emit(BookingError("Please select service and date"));
      return;
    }

    emit(BookingLoading());

    try {
      // simulate API call
      await Future.delayed(const Duration(seconds: 2));

      emit(BookingSuccess());

      // reset after success
      resetBooking();
    } catch (e) {
      emit(BookingError("Something went wrong"));
    }
  }

  // =====================
  // Reset Flow
  // =====================
  void resetBooking() {
    selectedService = null;
    selectedDate = null;
    notes = null;

    emit(BookingInitial());
  }
}