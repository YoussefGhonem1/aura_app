import 'package:aura_app/src/features/analyzes/screens/analyzes_screen.dart';
import 'package:aura_app/src/features/create_account/screens/create_account_screen.dart';
import 'package:aura_app/src/features/forget_password/screens/create_new_password.dart';
import 'package:aura_app/src/features/forget_password/screens/forget_password_screen.dart';
import 'package:aura_app/src/features/forget_password/screens/suceess_reset_screen.dart';
import 'package:aura_app/src/features/forget_password/screens/verify_email.dart';
import 'package:aura_app/src/features/investment_preferences/screens/investment_preferences_screen.dart';
import 'package:aura_app/src/features/layout/screens/layout_screen.dart';
import 'package:aura_app/src/features/legal_screens/screens/disclaimer_ai_ethics.dart';
import 'package:aura_app/src/features/legal_screens/screens/privacy_policy_screen.dart';
import 'package:aura_app/src/features/legal_screens/screens/terms_of_service_screen.dart';
import 'package:aura_app/src/features/legal_support/screens/legal_support_screen.dart';
import 'package:aura_app/src/features/login/screens/login_screen.dart';
import 'package:aura_app/src/features/no_internet/screens/no_internet_screen.dart';
import 'package:aura_app/src/features/notification_settings/screens/notification_settings_screen.dart';
import 'package:aura_app/src/features/notifications/screens/notification_screen.dart';
import 'package:aura_app/src/features/on_boarding/screens/on_boarding_screen.dart';
import 'package:aura_app/src/features/personal_info/screens/personal_info.dart';
import 'package:aura_app/src/features/recommendation_reason/screens/recommendation_reason_screen..dart';
import 'package:aura_app/src/features/risk_disclaimer/screens/risk_disclaimer_screen.dart';
import 'package:aura_app/src/features/smart_automation/screens/smart_automation.dart';
import 'package:aura_app/src/features/splash/screens/splash_screen.dart';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/features/stock_details/screens/stock_details_screen.dart';
import 'package:aura_app/src/features/stocks_compare/screens/stocks_compare_screen.dart';
import 'package:aura_app/src/features/support_screens/screens/contact_us_screen.dart';
import 'package:aura_app/src/features/support_screens/screens/help_center_screen.dart';
import 'package:aura_app/src/features/support_screens/screens/report_bug_screen.dart';
import 'package:aura_app/src/features/transaction_history/screens/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

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

       case Routes.recommendationReasonScreen:
        final args = settings.arguments as StockModel;
        return MaterialPageRoute(
          builder: (_) => RecommendationReasonScreen(stock: args),
        );

      case Routes.notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());  

      case Routes.riskDisclaimerScreen:
        return MaterialPageRoute(builder: (_) => const RiskDisclaimerScreen());

      case Routes.transactionHistoryScreen:
        return MaterialPageRoute(builder: (_) => const TransactionHistoryScreen());
        
      case Routes.personalInfoScreen:
        return MaterialPageRoute(builder: (_) => const PersonalInfoScreen());

        case Routes.investmentPreferencesScreen:
         return MaterialPageRoute(builder: (_) => const InvestmentPreferencesScreen());

         case Routes.analysisScreen:
        return MaterialPageRoute(builder: (_) => const AnalyzesScreen());

      case Routes.smartAutomationScreen:
        return MaterialPageRoute(builder: (_) => const SmartAutomationScreen());

      case Routes.notificationSettingsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationSettingsScreen());

      case Routes.legalSupportScreenEnhanced:
        return MaterialPageRoute(builder: (_) => const LegalSupportScreenEnhanced());

      case Routes.disclaimerScreenEnhanced:
        return MaterialPageRoute(builder: (_) => const DisclaimerScreenEnhanced());

      case Routes.termsOfServiceScreenEnhanced:
        return MaterialPageRoute(builder: (_) => const TermsOfServiceScreenEnhanced());

      case Routes.privacyPolicyScreenEnhanced:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreenEnhanced());

      case Routes.helpCenterScreenEnhanced:
        return MaterialPageRoute(builder: (_) => const HelpCenterScreenEnhanced());

      case Routes.reportBugScreenEnhanced:
        return MaterialPageRoute(builder: (_) => const ReportBugScreenEnhanced());

      case Routes.contactUsScreenEnhanced:
       return MaterialPageRoute(builder: (_) => const ContactUsScreenEnhanced());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 - Page Not Found'))),
        );
    }
  }
}
