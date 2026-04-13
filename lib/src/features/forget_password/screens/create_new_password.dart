import 'package:aura_app/src/features/forget_password/widgets/build_validation_item.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/componants/custom_button.dart';
import 'package:aura_app/src/shared/componants/text_form.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  bool _hasEightChars = true;
  bool _hasUppercase = true;
  bool _hasNumber = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bool passwordHasError =
        !_hasEightChars || !_hasUppercase || !_hasNumber;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          context.tr('Create New Password', 'إنشاء كلمة مرور جديدة'),
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              context.tr(
                'Your new password must be different from previously used passwords.',
                'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمات المرور السابقة.',
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 40),

            AuraTextField(
              label: context.tr('New Password', 'كلمة المرور الجديدة'),
              hintText: context.tr(
                'Enter new password',
                'أدخل كلمة المرور الجديدة',
              ),
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

            const SizedBox(height: 30),
            AuraTextField(
              label: context.tr('Confirm Password', 'تأكيد كلمة المرور'),
              hintText: context.tr(
                'Re-enter password',
                'أعد إدخال كلمة المرور',
              ),
              isPassword: true,
              hasError: passwordHasError,
              controller: _confirmPasswordController,
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

            const SizedBox(height: 50),

            AuraButton(
              title: context.tr('Reset password', 'إعادة تعيين كلمة المرور'),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.successResetPassword,
                );
              },
            ),

            const SizedBox(height: 20),

            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 14,
                      color: Color(0xFF10B981),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      context.tr(
                        'END-TO-END ENCRYPTED',
                        'تشفير شامل من الطرف للطرف',
                      ),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
