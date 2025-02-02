import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/usecases/login_usecase.dart';
import 'login_events.dart';
import 'login_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final response = await loginUseCase.execute(event.email, event.password);
        emit(AuthSuccess(response));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
