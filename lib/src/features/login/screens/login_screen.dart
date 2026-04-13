import 'package:aura_app/src/features/create_account/widgets/social_driver.dart';
import 'package:aura_app/src/features/forget_password/widgets/build_validation_item.dart';
import 'package:aura_app/src/features/login/widgets/face_id_button.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/componants/auth_option.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _hasEightChars = true;

  bool _hasUppercase = true;

  bool _hasNumber = true;

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool passwordHasError =
        !_hasEightChars || !_hasUppercase || !_hasNumber;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondaryColor.withOpacity(0.15),
                      blurRadius: 20,
                      spreadRadius: -12,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/auth_leading.png',
                  width: 120,
                ),
              ),
            ),

            const SizedBox(height: 10),
            Text(
              context.tr('Welcome Back', 'مرحبًا بعودتك'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 5),
            Text(
              context.tr(
                'Your intelligent investment portfolio is ready',
                'محفظتك الاستثمارية الذكية جاهزة',
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: 40),
            AuraTextField(
              label: context.tr('Email Address', 'البريد الإلكتروني'),
              hintText: context.tr('name@example.com', 'name@example.com'),
            ),
            const SizedBox(height: 20),
            AuraTextField(
              label: context.l10n.password,
              hintText: context.l10n.password,
              isPassword: true,
              hasError: passwordHasError,
              controller: _passwordController,
              tooltipContent: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildValidationItem(
                    context.tr('At least 8 characters', '8 أحرف على الأقل'),
                    _hasEightChars,
                  ),
                  buildValidationItem(
                    context.tr('One uppercase letter', 'حرف كبير واحد'),
                    _hasUppercase,
                  ),
                  buildValidationItem(
                    context.tr('One number', 'رقم واحد'),
                    _hasNumber,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.forgetPassword);
                },
                child: Text(
                  context.l10n.forgetPassword,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(height: 25),
            AuraButton(
              title: context.l10n.signIn,
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.layoutScreen);
              },
            ),

            const SizedBox(height: 20),
            AuthOptionWidget(
              mainText: context.tr('Don\'t have an account?', 'ليس لديك حساب؟'),
              actionText: context.l10n.signUp,
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.createAccount);
              },
            ),
            const SizedBox(height: 30),

            buildSocialDivider(
              context,
              context.tr('Or continue with', 'أو تابع عبر'),
            ),

            const SizedBox(height: 20),
            FaceIDButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
