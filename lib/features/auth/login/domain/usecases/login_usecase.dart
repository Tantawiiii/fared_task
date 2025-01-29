
import '../../data/repository/login_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<String, String>> execute(String username, String password) {
    return _repository.login(username, password);
  }
}
