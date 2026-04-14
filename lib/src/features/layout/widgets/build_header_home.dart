import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildHeader(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 48,
            height: 48,
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
          Row(
            children: [
              Icon(Icons.search_rounded, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              buildNotificationIcon(context),
            ],
          ),
        ],
      ),
      SizedBox(height: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.goodMorningYoussef,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            context.l10n.portfolioUpToday,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.greyText),
          ),
        ],
      ),
    ],
  );
}

Widget buildNotificationIcon(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(30),
    onTap: () {
      Navigator.pushNamed(context, Routes.notificationsScreen);
    },
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
        Positioned(
          right: 12,
          top: 12,
          child: Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  );
}
