import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'features/auth/login/data/repository/login_repo.dart';
import 'features/auth/login/data/services/auth_service.dart';
import 'features/auth/login/domain/usecases/login_usecase.dart';
import 'features/auth/login/domain/usecases/login_usecase_implement.dart';
import 'features/home/cubit/session_bloc.dart';
import 'features/home/data/service/session_service.dart';
import 'generate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar', null);

  runApp(
    MultiProvider(
      providers: [
        Provider<LoginUseCase>(
          create: (_) => LoginUseCaseImplementation(
            AuthRepository(AuthService()),
          ),
        ),
        BlocProvider(
          create: (context) => SessionCubit(SessionService())..fetchSessions(),
        ),
      ],
      child: Generate(
        appRouter: AppRouter(),
      ),
    ),
  );
}
