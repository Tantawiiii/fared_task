import 'package:dartz/dartz.dart';

import '../../data/repository/login_repo.dart';
import 'login_usecase.dart';

class LoginUseCaseImplementation extends LoginUseCase {
  final AuthRepository _repository;

  LoginUseCaseImplementation(this._repository) : super(_repository);

  @override
  Future<Either<String, String>> execute(String username, String password) {
    return _repository.login(username, password);
  }
}
