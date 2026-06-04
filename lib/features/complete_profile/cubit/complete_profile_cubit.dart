import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuer_app/features/complete_profile/cubit/complete_profile_state.dart';
import 'package:cuer_app/features/profile/model/profile_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(ProfileInitial());

  Future<void> saveProfile(ProfileModel profile) async {
    emit(ProfileLoading());

    try {
      print("🚀 Save Profile Started");
      print("UID: ${profile.uid}");

      if (profile.uid.isEmpty) {
        emit(ProfileError("UID is empty"));
        return;
      }

      await FirebaseFirestore.instance
          .collection("users")
          .doc(profile.uid)
          .set(profile.toJson());

      print("✅ Firestore Save Completed");

      emit(ProfileCompleted());
    } catch (e) {
      print("❌ ERROR: $e");
      emit(ProfileError(e.toString()));
    }
  }
}