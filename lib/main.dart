import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'features/auth/login/data/repository/login_repo.dart';
import 'features/auth/login/data/services/auth_service.dart';
import 'features/auth/login/domain/usecases/login_usecase.dart';
import 'features/auth/login/domain/usecases/login_usecase_implement.dart';
import 'generate.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(

      MultiProvider(
        providers: [
          Provider<LoginUseCase>(
            create: (_) => LoginUseCaseImplementation(
              AuthRepository(AuthService()),
            ),
          ),
        ],
        child:   Generate(
          appRouter: AppRouter(),
        ),
      ),


  );
}
