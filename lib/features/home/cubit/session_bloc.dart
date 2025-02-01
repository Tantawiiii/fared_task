import 'package:fared_task/features/home/cubit/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/service/session_service.dart';


class SessionCubit extends Cubit<SessionState> {
  final SessionService _sessionService;

  SessionCubit(this._sessionService) : super(SessionInitial());

  void fetchSessions() async {
    emit(SessionLoading());
    try {
      final sessions = await _sessionService.fetchSessions();
      emit(SessionLoaded(sessions));
    } catch (e) {
      emit(SessionError(e.toString()));
    }
  }
}
