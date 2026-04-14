import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget orderValueCard(BuildContext context, double orderValue) {
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.secondaryColor.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(
            context.l10n.estOrderValue,
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 11,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "\$${orderValue.toStringAsFixed(2)}",
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            context.l10n.auraAiExecutionOptimizedForLowSlippage,
            style: const TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}
