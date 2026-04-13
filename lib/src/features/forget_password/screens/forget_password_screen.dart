import 'package:aura_app/src/features/forget_password/widgets/animated_icon.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
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
              context.l10n.forgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 5),
            Text(
              context.tr(
                'Enter your email address and we will send you a link to reset your password.',
                'أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 40),

            AuraTextField(
              label: context.tr('Email Address', 'البريد الإلكتروني'),
              hintText: context.tr('name@example.com', 'name@example.com'),
              suffixIcon: Icons.email_outlined,
            ),

            const SizedBox(height: 30),

            AuraButton(
              title: context.tr('Send reset code', 'إرسال رمز التعيين'),
              onPressed: () {
                Navigator.pushNamed(context, Routes.verifyEmail);
              },
            ),

            const Spacer(),

            AuthOptionWidget(
              mainText: context.tr(
                'Remember your password?',
                'تتذكر كلمة المرور؟',
              ),
              actionText: context.tr('Log in', 'تسجيل الدخول'),
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
