import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildAnimatedLockIcon(IconData iconData) {
  return Container(
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: AppColors.cardColor.withOpacity(0.8),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.15),
          blurRadius: 30,
          spreadRadius: 10,
        ),
      ],
    ),
    child: Icon(iconData, size: 60, color: AppColors.secondaryColor),
  );
}
