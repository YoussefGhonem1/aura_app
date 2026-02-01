  import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

/// SENTIMENT CARD
  Widget sentimentCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sentiment Score",
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
                  "Market Mood",
                  style: TextStyle(color: AppColors.greyText, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bullish",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: AppColors.secondaryColor.withOpacity(0.3),
                            offset: Offset(0, 1),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "85/100",
                      style: TextStyle(
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
                    value: 0.85,
                    backgroundColor: AppColors.surfaceColor,
                    valueColor: const AlwaysStoppedAnimation(
                      AppColors.secondaryColor,
                    ),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bearish",
                      style: TextStyle(color: AppColors.greyText, fontSize: 11),
                    ),
                    Text(
                      "Neutral",
                      style: TextStyle(color: AppColors.greyText, fontSize: 11),
                    ),
                    Text(
                      "Very Bullish",
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