import 'package:dartz/dartz.dart';
import '../model/login_model.dart';
import '../services/auth_service.dart';

class AuthRepository {
  final AuthService _service;

  AuthRepository(this._service);

  Future<Either<String, String>> login(String username, String password) async {
    try {
      final token = await _service.login(LoginRequest(username, password));
      return Right(token);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
