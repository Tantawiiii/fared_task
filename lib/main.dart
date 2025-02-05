import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'features/auth/login/cubit/login_cubit.dart';
import 'features/auth/login/data/repository/auth_repo_impl.dart';
import 'features/auth/login/domain/usecases/login_usecase.dart';
import 'features/getMeeting/cubit/meeting_recording_bloc.dart';
import 'features/getMeeting/data/meeting_recording_service.dart';
import 'features/home/cubit/session_bloc.dart';
import 'features/home/data/service/session_service.dart';
import 'generate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);
  final dio = Dio();
  final authRepository = AuthRepositoryImpl(dio);
  final loginUseCase = LoginUseCase(authRepository);
  Intl.defaultLocale = 'ar_SA';
  final meetingRecordingService = MeetingRecordingService();

  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(loginUseCase)),
        BlocProvider(
          create: (context) => SessionCubit(SessionService())..fetchSessions(),
        ),
        BlocProvider(create: (_) => MeetingRecordingCubit(meetingRecordingService)),

      ],
      child: Generate(
        appRouter: AppRouter(),
      ),
    ),
  );
}
