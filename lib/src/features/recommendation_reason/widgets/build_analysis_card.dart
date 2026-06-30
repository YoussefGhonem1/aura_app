import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// ANALYSIS CARD
Widget analysisCard(StockModel stock) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.primaryColor.withOpacity(0.9),
          AppColors.primaryColor.withOpacity(0.3),
          AppColors.primaryColor.withOpacity(0.1),
        ],
      ),
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.15)),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LEFT CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          AppColors.secondaryColor,
                          AppColors.secondaryColor.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.analytics_rounded,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "تحليل AURA AI",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),
                  // استخدام حقل وقت التحديث من الموديل
                  Text(
                    stock.analysisUpdated,
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // استخدام حقل التحليل من الموديل
              Text(
                stock.aiAnalysis,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  height: 1.5, // لزيادة المسافة بين السطور لتسهيل القراءة
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),
      ],
    ),
  );
}
