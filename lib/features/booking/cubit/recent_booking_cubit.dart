import 'package:bloc/bloc.dart';
import 'package:cuer_app/features/booking/cubit/recent_booking_state.dart';
import 'package:cuer_app/features/booking/repository/booking_repository.dart';

class BookingListCubit extends Cubit<BookingListState> {
  BookingListCubit() : super(BookingListInitial());

final repository = BookingRepository();

Future<void> getBookings() async {
  emit(BookingListLoading());

  try {
    final bookings = await repository.getBookings();
    emit(BookingListSuccess(bookings));
  } catch (e) {
    emit(BookingListError(e.toString()));
  }
}

  
}