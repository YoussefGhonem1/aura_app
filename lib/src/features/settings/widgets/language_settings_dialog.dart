import 'package:aura_app/src/core/bloc/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class LanguageSettingsDialog extends StatelessWidget {
  const LanguageSettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.secondaryColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: AppColors.secondaryColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            final languageBloc = context.read<LanguageBloc>();
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.language_rounded,
                      color: AppColors.secondaryColor,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      context.l10n.language,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(999),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: AppColors.greyText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '${context.l10n.english} / ${context.l10n.arabic}',
                  style: const TextStyle(
                    color: AppColors.greyText,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 20),
                _LanguageOption(
                  language: context.l10n.english,
                  isSelected: languageBloc.isEnglish,
                  onTap: () {
                    languageBloc.changeLanguage('en');
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 12),
                _LanguageOption(
                  language: context.l10n.arabic,
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.surfaceColor,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: AppColors.secondaryColor.withOpacity(0.2),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
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
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? AppColors.secondaryColor
                : AppColors.white.withOpacity(0.16),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? AppColors.secondaryColor.withOpacity(0.12)
              : AppColors.surfaceColor.withOpacity(0.45),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.greyText,
                  width: 2,
                ),
                color: isSelected
                    ? AppColors.secondaryColor.withOpacity(0.15)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check_rounded,
                      color: AppColors.secondaryColor,
                      size: 14,
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                language,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? AppColors.white : AppColors.greyText,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: AppColors.secondaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
