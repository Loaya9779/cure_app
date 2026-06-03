abstract class CompleteProfileState {}

class ProfileInitial extends CompleteProfileState {}

class ProfileLoading extends CompleteProfileState {}

class ProfileCompleted extends CompleteProfileState {}

class ProfileError extends CompleteProfileState {
  final String message;
  ProfileError(this.message);
}