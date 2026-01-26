import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

  Widget buildLogoContainer() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.2),
            blurRadius: 60,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Image.asset(
        'assets/icons/aura_logo.png',
        width: 170,
        color: AppColors.secondaryColor.withAlpha(240),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }