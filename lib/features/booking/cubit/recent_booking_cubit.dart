import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuer_app/features/booking/cubit/recent_booking_state.dart';
import 'package:cuer_app/features/booking/repository/booking_repository.dart';

class BookingListCubit extends Cubit<BookingListState> {
  BookingListCubit(this.repository) : super(BookingListInitial());

  final BookingRepository repository;

  Future<void> getBookings() async {
    emit(BookingListLoading());

    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final bookings = await repository.getUserBookingsOnce(uid);

      emit(BookingListSuccess(bookings));
    } catch (e) {
      emit(BookingListError(e.toString()));
    }
  }
}