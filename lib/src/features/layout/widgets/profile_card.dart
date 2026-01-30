import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildUserProfileCard() {
  return Center(
    child: Column(
      children: [
        Container(
          width: 70,
          height: 70,
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
        const SizedBox(height: 12),
        // Name
        Text(
          "Youssef Ghonem",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        // Email
        Text(
          "youssef.ghonem@example.com",
          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
        ),
        const SizedBox(height: 8),
        // PRO MEMBER Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.secondaryColor.withOpacity(0.25),
                AppColors.accentColor.withOpacity(0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star_rounded,
                color: AppColors.secondaryColor,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                "PRO MEMBER",
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
