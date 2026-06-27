import 'package:aura_app/generated_l10n/app_localizations.dart';
import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:aura_app/src/core/network/api_client.dart';
import 'package:aura_app/src/core/repository/auth_repository.dart';
import 'package:aura_app/src/core/repository/auth_repository_impl.dart';
import 'package:aura_app/src/shared/routing/app_routes.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/shared/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthRepository>(
      create: (_) => AuthRepositoryImpl(),
      child: RepositoryProvider<ApiClient>(
        create: (context) =>
            ApiClient(authRepository: context.read<AuthRepository>()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LanguageBloc()),
            BlocProvider(
              create: (context) => AuthCubit(
                context.read<AuthRepository>(),
                context.read<ApiClient>(),
              ),
            ),
          ],
          child: BlocBuilder<LanguageBloc, LanguageState>(
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
          ),
        ),
      ),
    );
  }
}
