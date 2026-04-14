import 'package:aura_app/src/features/layout/widgets/build_header_home.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
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
                context.l10n.welcomeBackComma,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppColors.greyText),
              ),
              Text(
                context.tr('Youssef', 'يوسف'),
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
      buildNotificationIcon(context),
    ],
  );
}
