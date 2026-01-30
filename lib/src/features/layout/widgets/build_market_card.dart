import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildMarketCard(String name, String price, String change, bool isUp) {
  return Container(
    width: 160,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withOpacity(0.05)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: AppColors.greyText,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Icon(
              isUp ? Icons.trending_up : Icons.trending_down,
              color: isUp ? AppColors.accentColor : AppColors.errorColor,
              size: 22,
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          price,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          change,
          style: TextStyle(
            color: isUp ? AppColors.accentColor : AppColors.errorColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
