abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthLoginSuccess extends AuthState {
  final String message;
  AuthLoginSuccess(this.message);
}

class AuthRegisterSuccess extends AuthState {
  final String message;
  AuthRegisterSuccess(this.message);
}

class ResetPasswordSuccess extends AuthState {
  final String email;
  ResetPasswordSuccess(this.email);
}