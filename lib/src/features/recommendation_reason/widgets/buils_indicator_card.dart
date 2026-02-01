
  import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget indicatorCard({
    required String title,
    required String value,
    required String subtitle,
    Color valueColor = AppColors.secondaryColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.greyText, fontSize: 13),
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: valueColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: valueColor.withOpacity(0.5),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(subtitle, style: TextStyle(color: valueColor, fontSize: 13)),
        ],
      ),
    );
  }