import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

Widget buildHeadRecommendationTextWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.whyThisRecommendation,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.auto_awesome, color: AppColors.secondaryColor, size: 28),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.auraInsight,
          style: TextStyle(
            color: AppColors.greyText,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
