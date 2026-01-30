import 'package:aura_app/src/features/create_account/screens/create_account_screen.dart';
import 'package:aura_app/src/features/forget_password/screens/create_new_password.dart';
import 'package:aura_app/src/features/forget_password/screens/forget_password_screen.dart';
import 'package:aura_app/src/features/forget_password/screens/suceess_reset_screen.dart';
import 'package:aura_app/src/features/forget_password/screens/verify_email.dart';
import 'package:aura_app/src/features/layout/screens/layout_screen.dart';
import 'package:aura_app/src/features/login/screens/login_screen.dart';
import 'package:aura_app/src/features/no_internet/screens/no_internet_screen.dart';
import 'package:aura_app/src/features/on_boarding/screens/on_boarding_screen.dart';
import 'package:aura_app/src/features/splash/screens/splash_screen.dart';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/features/stock_details/screens/stock_details_screen.dart';
import 'package:aura_app/src/features/stocks_compare/screens/stocks_compare_screen.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case Routes.createAccount:
        return MaterialPageRoute(builder: (_) => CreateAccount());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case Routes.verifyEmail:
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());

      case Routes.createNewPassword:
        return MaterialPageRoute(builder: (_) => CreateNewPasswordPage());

      case Routes.successResetPassword:
        return MaterialPageRoute(builder: (_) => const SuccessPasswordScreen());

      case Routes.noInternetScreen:
        return MaterialPageRoute(builder: (_) => const NoInternetScreen());

      case Routes.stockDetailsScreen:
        final args = settings.arguments as StockModel;
        return MaterialPageRoute(
          builder: (_) => StockDetailsScreen(stock: args),
        );

      case Routes.layoutScreen:
        return MaterialPageRoute(builder: (_) => const MainLayoutScreen());

      case Routes.stocksCompareScreen:
        final args = settings.arguments as Map<String, StockModel>;
        return MaterialPageRoute(
          builder: (_) => StockComparisonScreen(
            stock1: args['stock1']!,
            stock2: args['stock2']!,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 - Page Not Found'))),
        );
    }
  }
}
