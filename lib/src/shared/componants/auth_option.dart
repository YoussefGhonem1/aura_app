import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class AuthOptionWidget extends StatelessWidget {
  final String mainText;      
  final String actionText;    
  final VoidCallback onTap;   

  const AuthOptionWidget({
    required this.mainText,
    required this.actionText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.greyText, 
                fontSize: 14,
              ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            " $actionText",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }
}