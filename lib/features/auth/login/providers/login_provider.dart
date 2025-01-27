import 'package:flutter/material.dart';
import '../data/repository/login_repo.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;
  String? _generalError;

  bool get isLoading => _isLoading;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  String? get generalError => _generalError;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _emailError = null;
    _passwordError = null;
    _generalError = null;
    notifyListeners();

    final response = await _authRepository.login(email, password);

    _isLoading = false;
    if (response['success']) {
      return true;
    } else {
      if (response['error'] != null) {
        final errorDetails = response['error'];
        if (errorDetails.contains('The Password field is required')) {
          _passwordError = 'Password is required';
        }
        if (errorDetails.contains('The UserNameOrEmailAddress field is required')) {
          _emailError = 'Email is required';
        }
      }
      _generalError = 'Invalid credentials. Please try again.';
      notifyListeners();
      return false;
    }
  }
}
