import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData Theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryColor,
    primaryColor: AppColors.secondaryColor,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.primaryColor,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceColor,
      hintStyle: const TextStyle(color: AppColors.greyText, fontSize: 15),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.12),
          width: 1.0,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.secondaryColor,
          width: 1.3,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        letterSpacing: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.secondaryColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.greyText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.secondaryColor,
      ),
    ),
  );
}
