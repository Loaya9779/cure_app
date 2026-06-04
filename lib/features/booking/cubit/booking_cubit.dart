import 'package:cuer_app/features/booking/cubit/booking_state.dart';
import 'package:cuer_app/features/booking/model/booking_model.dart';
import 'package:cuer_app/features/booking/repository/booking_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this._repo) : super(BookingInitial());

  final BookingRepository _repo;

  String? selectedService;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? notes;

  void selectService(String service) {
    selectedService = service;
    emit(ServiceSelected());
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    emit(DateSelected());
  }

  void selectTime(TimeOfDay time) {
    selectedTime = time;
    emit(TimeSelected());
  }

  void addNotes(String value) {
    notes = value;
    emit(NotesAdded());
  }

  bool canConfirmBooking() {
    return selectedService != null &&
        selectedDate != null &&
        selectedTime != null;
  }

  Future<void> confirmBooking() async {
    if (!canConfirmBooking()) {
      emit(BookingError("Please select service, date and time"));
      return;
    }

    emit(BookingLoading());

    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final fullDateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );

      final booking = BookingModel(
        userId: uid,
        service: selectedService!,
        date: fullDateTime,
        notes: notes,
        status: "upcoming",
      );

      await _repo.createBooking(booking);

      emit(BookingSuccess());

      resetBooking();
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  void resetBooking() {
    selectedService = null;
    selectedDate = null;
    selectedTime = null;
    notes = null;

    emit(BookingInitial());
  }
}