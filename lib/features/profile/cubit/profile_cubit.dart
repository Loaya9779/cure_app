import 'package:cuer_app/features/profile/cubit/profile_state.dart';
import 'package:cuer_app/features/profile/model/profile_model.dart';
import 'package:cuer_app/features/profile/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(ProfileInitial());

  final ProfileRepository _repo;

  Future<void> getProfile(String uid) async {
    emit(ProfileLoading());

    try {
      final profile = await _repo.getProfile(uid);
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    emit(ProfileLoading());

    try {
      await _repo.updateProfile(profile);

      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
