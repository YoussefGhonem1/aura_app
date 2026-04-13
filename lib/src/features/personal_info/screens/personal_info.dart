import 'package:aura_app/src/features/personal_info/widgets/info_field.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, context.l10n.personalInfo),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: PersonalInfoContent(),
      ),
      bottomNavigationBar: _buildBottomButton(context),
    );
  }

  static Widget _buildBottomButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: AppColors.primaryColor,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.tr('Save Changes', 'حفظ التغييرات'),
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward,
              color: AppColors.primaryColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalInfoContent extends StatelessWidget {
  const PersonalInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePhotoSection(),
        const SizedBox(height: 32),
        PersonalInfoForm(),
        const SizedBox(height: 40),
      ],
    );
  }
}

class ProfilePhotoSection extends StatelessWidget {
  final VoidCallback? onChangePhoto;

  const ProfilePhotoSection({super.key, this.onChangePhoto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            /// Profile Circle with Gradient
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondaryColor.withOpacity(0.7),
                    AppColors.secondaryColor.withOpacity(0.1),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/official_photo.jpeg',
                    fit: BoxFit.cover,
                    width: 112,
                    height: 112,
                  ),
                ),
              ),
            ),

            /// Camera Button
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onChangePhoto,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondaryColor,
                    border: Border.all(color: AppColors.primaryColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        /// Change Photo Button
        TextButton(
          onPressed: onChangePhoto,
          child: Text(
            context.tr('Change Photo', 'تغيير الصورة'),
            style: const TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoField(
          label: context.tr('Full Name', 'الاسم الكامل'),
          value: 'Youssef Ghonem',
        ),
        const SizedBox(height: 20),
        InfoField(
          label: context.tr('Email Address', 'البريد الإلكتروني'),
          value: 'youssef.ahmed@example.com',
        ),
        const SizedBox(height: 20),
        InfoField(
          label: context.tr('Phone Number', 'رقم الهاتف'),
          value: '+20 1014395851',
        ),
        const SizedBox(height: 20),
        InfoField(
          label: context.tr('Country / Region', 'الدولة / المنطقة'),
          value: context.tr('Egypt', 'مصر'),
        ),
      ],
    );
  }
}
