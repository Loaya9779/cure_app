import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardState {
  final int active;
  final int upcoming;
  final int history;

  DashboardState({this.active = 0, this.upcoming = 0, this.history = 0});

  DashboardState copyWith({
    int? active,
    int? upcoming,
    int? history ,
  }) {
    return DashboardState(
      active: active ?? this.active,
      upcoming: upcoming ?? this.upcoming,
      history: history ?? this.history,
    );
  }
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void loadDashboard(String userId) {
    firestore
        .collection("bookings")
        .where("userId", isEqualTo: userId)
        .snapshots()
        .listen((snapshot) {
          int active = 0;
          int upcoming = 0;
          int history = active + upcoming;

          for (var doc in snapshot.docs) {
            final status = doc["status"];

            if (status == "active") {
              active++;
            } else if (status == "upcoming") {
              upcoming++;
            } else {
              history++;
            }
          }

          emit(
            DashboardState(
              active: active,
              upcoming: upcoming,
              history: history,
            ),
          );
        });
  }
}
