import 'package:aura_app/src/features/forget_password/widgets/animated_icon.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class SuccessPasswordScreen extends StatelessWidget {
  const SuccessPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            buildAnimatedLockIcon(Icons.check_circle_rounded),

            const SizedBox(height: 40),

            Text(
              "Password Reset!",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              "Your password has been successfully reset. You can now log in to manage your portfolio with Aura AI.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.greyText,
                height: 1.5,
              ),
            ),

            const Spacer(),

            AuraButton(
              title: "Get Started",
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
