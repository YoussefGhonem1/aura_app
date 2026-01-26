import 'package:aura_app/src/features/create_account/screens/create_account_screen.dart';
import 'package:aura_app/src/features/login/screens/login_screen.dart';
import 'package:aura_app/src/features/on_boarding/screens/on_boarding_screen.dart';
import 'package:aura_app/src/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccount());
        case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 - Page Not Found'))),
        );
    }
  }
}
