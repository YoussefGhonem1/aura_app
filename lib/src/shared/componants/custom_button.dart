import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuraButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const AuraButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}