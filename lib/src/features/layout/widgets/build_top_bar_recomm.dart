import 'package:aura_app/src/features/layout/widgets/build_header_home.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildTopBar(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.secondaryColor,
            child: Icon(Icons.auto_awesome, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text(
            context.l10n.auraAi,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          buildNotificationIcon(context),
        ],
      ),
      const SizedBox(height: 10),
      Text(
        context.l10n.marketAnalysisUpdated2mAgo,
        style: TextStyle(
          color: AppColors.secondaryColor.withOpacity(0.7),
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ],
  );
}
