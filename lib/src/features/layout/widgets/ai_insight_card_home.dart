import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildDailyAIInsightCard(BuildContext context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.1)),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.15),
          blurRadius: 15,
          offset: const Offset(0, 4),
          spreadRadius: 2,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.flash_on,
                    color: AppColors.secondaryColor,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "رؤية أورا الذكية",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Text(
              "نسبة الثقة 87%",
              style: TextStyle(color: AppColors.greyText, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          "توقعات صعود قطاع العقارات",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          "تشير نماذج الذكاء الاصطناعي إلى اتجاه صعودي قوي لأسهم قطاع العقارات في البورصة المصرية اليوم، بناءً على أحجام التداول الأخيرة.",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.greyText,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.secondaryColor.withOpacity(0.1),
            ),
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "قراءة التحليل",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.secondaryColor,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
