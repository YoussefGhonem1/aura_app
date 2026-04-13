import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import '../widgets/language_settings_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settings), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Language Settings
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              final languageBloc = context.read<LanguageBloc>();
              return ListTile(
                leading: const Icon(Icons.language),
                title: Text(context.l10n.language),
                subtitle: Text(
                  languageBloc.isArabic
                      ? context.l10n.arabic
                      : context.l10n.english,
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const LanguageSettingsDialog(),
                  );
                },
              );
            },
          ),
          const Divider(),
          // More settings can be added here as needed
        ],
      ),
    );
  }
}
