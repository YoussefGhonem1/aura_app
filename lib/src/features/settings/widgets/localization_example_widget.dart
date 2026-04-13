import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';

/// Example Widget showing how to use localization in the app
class LocalizationExampleWidget extends StatelessWidget {
  const LocalizationExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display current language
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              final languageBloc = context.read<LanguageBloc>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.language,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Current: ${languageBloc.isArabic ? context.l10n.arabic : context.l10n.english}',
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => languageBloc.toggleLanguage(),
                    icon: const Icon(Icons.language),
                    label: Text(context.l10n.language),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),

          // Examples of using different localization strings
          Text(
            context.l10n.appTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          _ExampleRow(label: context.l10n.login, icon: Icons.login),
          _ExampleRow(
            label: context.l10n.createAccount,
            icon: Icons.person_add,
          ),
          _ExampleRow(label: context.l10n.email, icon: Icons.email),
          _ExampleRow(label: context.l10n.password, icon: Icons.lock),
          _ExampleRow(label: context.l10n.home, icon: Icons.home),
          _ExampleRow(label: context.l10n.portfolio, icon: Icons.dashboard),
          _ExampleRow(label: context.l10n.stocks, icon: Icons.trending_up),
          _ExampleRow(label: context.l10n.settings, icon: Icons.settings),
        ],
      ),
    );
  }
}

class _ExampleRow extends StatelessWidget {
  final String label;
  final IconData icon;

  const _ExampleRow({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }
}
