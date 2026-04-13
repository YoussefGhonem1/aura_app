import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

Widget buildSearchBar(BuildContext context) {
  return Container(
    height: 52,
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.15)),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.2),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: TextField(
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: AppColors.secondaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 14),

        prefixIcon: Icon(
          Icons.search_rounded,
          color: AppColors.greyText.withOpacity(0.6),
          size: 22,
        ),

        hintText: context.tr(
          'Search stocks, indices, symbols...',
          'ابحث عن الأسهم والمؤشرات والرموز...',
        ),
        hintStyle: TextStyle(
          color: AppColors.greyText.withOpacity(0.45),
          fontSize: 14,
        ),

        suffixIcon: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.mic_rounded,
            color: AppColors.secondaryColor,
            size: 20,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.secondaryColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
