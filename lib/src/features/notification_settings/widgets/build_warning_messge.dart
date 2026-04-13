import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildWarningMessage(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.orange.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.orange.withOpacity(0.3), width: 1),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(
                  'Some notifications may still be delivered via email if push notifications are disabled.',
                  'قد تستمر بعض الإشعارات في الوصول عبر البريد الإلكتروني إذا تم تعطيل الإشعارات الفورية.',
                ),
                style: TextStyle(
                  color: Colors.orange.withOpacity(0.9),
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  // Navigate to account settings
                },
                child: Text(
                  context.tr(
                    'You can manage email preferences in Account Settings.',
                    'يمكنك إدارة تفضيلات البريد الإلكتروني من إعدادات الحساب.',
                  ),
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
