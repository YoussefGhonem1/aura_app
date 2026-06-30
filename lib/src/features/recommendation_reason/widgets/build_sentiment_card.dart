import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// SENTIMENT CARD
Widget sentimentCard(StockModel stock) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "درجة المشاعر",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.secondaryColor.withOpacity(0.15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "معنويات السوق",
                style: TextStyle(color: AppColors.greyText, fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // استخدام حالة السوق من الموديل
                  Text(
                    stock.marketMood,
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: AppColors.secondaryColor.withOpacity(0.3),
                          offset: const Offset(0, 1),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                  ),
                  // استخدام نسبة المشاعر من الموديل
                  Text(
                    "${stock.sentimentScore}/100",
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  // تحويل النسبة المئوية من الموديل إلى قيمة عشرية بين 0 و 1
                  value: stock.sentimentScore / 100.0,
                  backgroundColor: AppColors.surfaceColor,
                  valueColor: const AlwaysStoppedAnimation(
                    AppColors.secondaryColor,
                  ),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "سبحة",
                    style: TextStyle(color: AppColors.greyText, fontSize: 11),
                  ),
                  Text(
                    "حيادي",
                    style: TextStyle(color: AppColors.greyText, fontSize: 11),
                  ),
                  Text(
                    "تفاؤل قوي جداً",
                    style: TextStyle(color: AppColors.greyText, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    ),
  );
}
