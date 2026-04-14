import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildTotalNetWorthCard(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.1)),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.15),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.1),
          blurRadius: 12,
          offset: const Offset(0, 4),
          spreadRadius: -2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.totalNetWorth,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.greyText,
                fontSize: 13,
                letterSpacing: 1,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.info_outline,
                color: AppColors.secondaryColor,
                size: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "\$124,592.40",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(Icons.trending_up, color: AppColors.accentColor, size: 18),
            const SizedBox(width: 6),
            Text(
              "+\$1,240.50",
              style: TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              context.l10n.percentTodayLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.greyText,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
