import '../model/login_model.dart';


abstract class AuthRepository {
  Future<AuthResponse> authenticate(String email, String password);
}
