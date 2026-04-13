import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';

class LanguageSettingsDialog extends StatelessWidget {
  const LanguageSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            final languageBloc = context.read<LanguageBloc>();
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.language,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _LanguageOption(
                  language: context.l10n.english,
                  value: 'en',
                  isSelected: languageBloc.isEnglish,
                  onTap: () {
                    languageBloc.changeLanguage('en');
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 12),
                _LanguageOption(
                  language: context.l10n.arabic,
                  value: 'ar',
                  isSelected: languageBloc.isArabic,
                  onTap: () {
                    languageBloc.changeLanguage('ar');
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(context.l10n.cancel),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String language;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.language,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.blue.shade50 : null,
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: isSelected ? value : '',
              onChanged: (_) => onTap(),
            ),
            const SizedBox(width: 10),
            Text(language, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
