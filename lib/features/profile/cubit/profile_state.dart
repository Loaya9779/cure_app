import 'package:cuer_app/features/profile/model/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;

  ProfileLoaded(this.profile);
}

class ProfileCompleted extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}