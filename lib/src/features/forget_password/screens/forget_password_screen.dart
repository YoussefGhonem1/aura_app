import 'package:aura_app/src/features/forget_password/widgets/animated_icon.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            buildAnimatedLockIcon(Icons.lock_reset_rounded),

            const SizedBox(height: 40),

            Text(
              "Forgot Password?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 5),
            Text(
              "Enter your email address and we will send you a link to reset your password.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 40),

            const AuraTextField(
              label: "Email Address",
              hintText: "name@example.com",
              suffixIcon: Icons.email_outlined,
            ),

            const SizedBox(height: 30),

            AuraButton(
              title: "Send reset code",
              onPressed: () {
                Navigator.pushNamed(context, Routes.verifyEmail);
              },
            ),

            const Spacer(),

            AuthOptionWidget(
              mainText: "Remember your password?",
              actionText: "Log in",
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
