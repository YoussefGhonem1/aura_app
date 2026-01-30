import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildHeaderPortfolio(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.secondaryColor.withOpacity(0.3),
                width: 2,
              ),
              image: const DecorationImage(
                image: AssetImage('assets/images/official_photo.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.greyText),
              ),
              Text(
                "Alex",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
      // Notification icon
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          Positioned(
            right: 6,
            top: 6,
            child: Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
