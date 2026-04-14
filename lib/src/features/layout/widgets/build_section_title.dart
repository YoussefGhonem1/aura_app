import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildSectionTitle(
  BuildContext context,
  String title, {
  bool showViewAll = true,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(color: Colors.white),
      ),
      if (showViewAll)
        TextButton(
          onPressed: () {},
          child: Text(
            context.l10n.viewAll,
            style: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
    ],
  );
}
