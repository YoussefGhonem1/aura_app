import 'package:aura_app/src/shared/routing/app_routes.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'src/shared/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AURA App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.Theme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.initial,
    );
  }
}
