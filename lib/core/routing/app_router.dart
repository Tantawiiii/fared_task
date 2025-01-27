
import 'package:fared_task/features/auth/onboarding_screen.dart';
import 'package:fared_task/features/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/ui/login_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

        case Routes.onBoardPage:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
        case Routes.loginPage:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
