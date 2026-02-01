
  import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildVersionCard() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.verified_user_rounded,
              color: AppColors.secondaryColor,
              size: 40,
            ),
            const SizedBox(height: 16),
            const Text(
              "Aura Investment Platform",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "VERSION 2.4.0 (BUILD 108)",
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Secure • AI-Powered • Compliant",
              style: TextStyle(
                color: AppColors.greyText.withOpacity(0.7),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }