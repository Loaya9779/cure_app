import 'dart:async';
import 'package:bloc/bloc.dart';
import '../repository/admin_booking_rebo.dart';
import 'admin_booking_state.dart';

class AdminBookingCubit extends Cubit<AdminBookingState> {
  final AdminBookingRepository repository;

  StreamSubscription? _subscription;

  AdminBookingCubit(this.repository) : super(BookingInitial());

  void getOrders() {
    emit(BookingLoading());

    _subscription?.cancel();

    _subscription = repository.getOrders().listen(
      (bookings) {
        if (!isClosed) {
          emit(BookingLoaded(bookings));
        }
      },
      onError: (error) {
        if (!isClosed) {
          emit(BookingError(error.toString()));
        }
      },
    );
  }

  Future<void> updateStatus(String id, String status) async {
    try {
      await repository.updateStatus(id, status);
      getOrders(); 
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  void deleteOrder(String id) async {
    try {
        print("DELETE ID: $id");
      await repository.deleteOrder(id);
      getOrders(); 
    } catch (e) {
      if (!isClosed) {
        emit(BookingError(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
