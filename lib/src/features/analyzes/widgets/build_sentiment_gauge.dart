import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget sentimentGauge(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 180,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 160,
              width: 160,
              child: CircularProgressIndicator(
                value: 0.68,
                strokeWidth: 10,
                backgroundColor: Colors.white.withOpacity(0.05),
                valueColor: const AlwaysStoppedAnimation(
                  AppColors.secondaryColor,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "68",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  context.tr('Greed', 'طمع'),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),
      Text(
        context.tr('+5% from yesterday', '+5% منذ الأمس'),
        style: TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        context.tr('Updated 5 mins ago', 'تم التحديث منذ 5 دقائق'),
        style: TextStyle(color: AppColors.greyText, fontSize: 12),
      ),
    ],
  );
}
