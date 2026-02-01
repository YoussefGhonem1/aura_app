import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
  String title, {
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.white,
            size: 18,
          ),
        ),
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 19,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    actions: actions ?? const [],
  );
}
