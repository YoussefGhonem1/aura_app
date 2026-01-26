import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
 Widget buildValidationItem(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.circle_outlined,
            color: isValid ? AppColors.secondaryColor : AppColors.greyText.withOpacity(0.5),
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: isValid ? Colors.white : AppColors.greyText,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }