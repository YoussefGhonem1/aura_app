import 'package:aura_app/generated_l10n/app_localizations.dart';
import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:aura_app/src/shared/routing/app_routes.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/shared/themes/app_theme.dart';
import 'src/core/bloc/language_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => LanguageBloc(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'AURA App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.Theme,
          locale: state.locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: Routes.initial,
        );
      },
    );
  }
}
