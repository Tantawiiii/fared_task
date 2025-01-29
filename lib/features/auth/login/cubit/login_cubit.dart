import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    final result = await _loginUseCase.execute(username, password);

    result.fold(
          (error) => emit(LoginFailure(error)),
          (token) => emit(LoginSuccess(token)),
    );
  }
}
