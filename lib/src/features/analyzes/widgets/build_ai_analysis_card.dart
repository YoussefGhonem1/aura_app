
  import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget aiAnalysisCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.cardColor,
            AppColors.cardColor.withOpacity(0.5),
            AppColors.secondaryColor.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: AppColors.secondaryColor,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                "AURA AI ANALYSIS",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            "Global markets are trending upward driven by unexpected rate cut signals from the Fed. Tech leads the rally while energy remains stable despite geopolitical tensions.",
            style: TextStyle(color: AppColors.white, fontSize: 14, height: 1.4),
          ),
        ],
      ),
    );
  }