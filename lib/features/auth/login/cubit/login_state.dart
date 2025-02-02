import '../data/model/login_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthResponse authResponse;
  AuthSuccess(this.authResponse);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
