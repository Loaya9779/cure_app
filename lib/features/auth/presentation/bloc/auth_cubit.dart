import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ================= REGISTER =================
  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthRegisterSuccess("Register Success"));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? "Register Failed"));
    } catch (_) {
      emit(AuthError("Something went wrong"));
    }
  }

  // ================= LOGIN =================
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      emit(AuthLoginSuccess("Login Success"));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? "Login Failed"));
    } catch (_) {
      emit(AuthError("Something went wrong"));
    }
  }

  // ================= LOGOUT =================
  Future<void> logout() async {
    await _auth.signOut();
    emit(AuthInitial());
  }

  // ================= RESET PASSWORD =================
  Future<void> resetPassword(String email) async {
    emit(AuthLoading());

    try {
      await _auth.sendPasswordResetEmail(email: email.trim());

      emit(ResetPasswordSuccess("Reset email sent successfully"));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? "Error sending reset email"));
    } catch (_) {
      emit(AuthError("Something went wrong"));
    }
  }
}
