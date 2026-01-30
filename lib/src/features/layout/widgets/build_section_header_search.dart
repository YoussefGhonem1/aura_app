import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildSectionHeader(
  String title, {
  bool hasClear = false,
  bool hasFilters = false,
  required bool isCompareMode,
  required VoidCallback toggleCompareMode,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      if (hasClear)
        const Text(
          "Clear",
          style: TextStyle(color: AppColors.secondaryColor, fontSize: 14),
        ),
      if (hasFilters)
        Row(
          children: [
            _buildFilterIcon(Icons.tune),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: toggleCompareMode,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isCompareMode
                      ? AppColors.secondaryColor.withOpacity(0.3)
                      : AppColors.cardColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isCompareMode
                        ? AppColors.secondaryColor
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Icon(
                  Icons.compare_arrows_rounded,
                  color: isCompareMode
                      ? AppColors.secondaryColor
                      : AppColors.secondaryColor,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
    ],
  );
}

Widget _buildFilterIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(icon, color: AppColors.secondaryColor, size: 20),
  );
}
