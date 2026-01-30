import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildAuraInsight(BuildContext context) {
  return Container(
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
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        // LEFT CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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
                      Icons.insights_rounded,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "AURA INSIGHT",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Title
              Text(
                "Watch Tech Hardware",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 6),

              // Description
              Text(
                "Sector momentum is up 4.2% today driven by new chip announcements.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.greyText,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        // RIGHT ICON CARD
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.secondaryColor.withOpacity(0.6),
                AppColors.secondaryColor.withOpacity(0.2),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.secondaryColor.withOpacity(0.4),
                blurRadius: 14,
              ),
            ],
          ),
          child: const Icon(
            Icons.memory_rounded,
            color: Colors.black,
            size: 40,
          ),
        ),
      ],
    ),
  );
}
