
import '../../data/model/login_model.dart';
import '../../data/repository/login_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthResponse> execute(String email, String password) {
    return repository.authenticate(email, password);
  }
}
