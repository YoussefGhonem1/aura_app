import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ContactUsScreenEnhanced extends StatelessWidget {
  const ContactUsScreenEnhanced({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(context, context.l10n.contactUs),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.all(28),
              margin: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.secondaryColor.withOpacity(0.1),
                    AppColors.primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.support_agent_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    context.tr('How can we help you?', 'كيف يمكننا مساعدتك؟'),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    context.tr(
                      'Choose your preferred channel to get in touch with our team.',
                      'اختر القناة المناسبة للتواصل مع فريقنا.',
                    ),
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Main Contact Channels
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Live Chat Card
                  _buildContactCard(
                    icon: Icons.chat_bubble_rounded,
                    iconBgColor: Colors.green.withOpacity(0.2),
                    iconColor: Colors.green,
                    title: context.tr('Live Chat', 'دردشة مباشرة'),
                    subtitle: context.tr(
                      'Chat with our experts',
                      'تحدث مع خبرائنا',
                    ),
                    details: [
                      _buildDetailItem(
                        icon: Icons.schedule_rounded,
                        text: context.tr('< 2 MINS', 'أقل من دقيقتين'),
                        color: AppColors.greyText,
                      ),
                      _buildDetailItem(
                        icon: Icons.circle,
                        text: context.tr('Online', 'متصل'),
                        color: Colors.green,
                        isStatus: true,
                      ),
                    ],
                    buttonText: context.tr('Start Chat', 'ابدأ الدردشة'),
                    buttonColor: Colors.green,
                    onTap: () {
                      // Open live chat
                    },
                  ),
                  const SizedBox(height: 20),

                  // Email Support Card
                  _buildContactCard(
                    icon: Icons.email_rounded,
                    iconBgColor: Colors.blue.withOpacity(0.2),
                    iconColor: Colors.blue,
                    title: context.tr('Email Support', 'الدعم عبر البريد'),
                    subtitle: "support@aura.app",
                    details: [
                      _buildDetailItem(
                        icon: Icons.schedule_rounded,
                        text: context.tr('24 hours', '24 ساعة'),
                        color: AppColors.greyText,
                      ),
                    ],
                    buttonText: context.tr('Send Email', 'إرسال بريد'),
                    buttonColor: Colors.blue,
                    onTap: () {
                      // Open email composer
                    },
                  ),
                  const SizedBox(height: 20),

                  // Social Media Card
                  _buildContactCard(
                    icon: Icons.public_rounded,
                    iconBgColor: Colors.purple.withOpacity(0.2),
                    iconColor: Colors.purple,
                    title: context.tr('Social Media', 'وسائل التواصل'),
                    subtitle: context.tr(
                      '@aura_app on Twitter/X',
                      '@aura_app على تويتر/X',
                    ),
                    details: [
                      _buildDetailItem(
                        icon: Icons.schedule_rounded,
                        text: context.tr('4 hours', '4 ساعات'),
                        color: AppColors.greyText,
                      ),
                    ],
                    buttonText: context.tr('Follow Us', 'تابعنا'),
                    buttonColor: Colors.purple,
                    onTap: () {
                      // Open social media
                    },
                  ),
                  const SizedBox(height: 20),

                  // Help Center Card
                  _buildContactCard(
                    icon: Icons.help_center_rounded,
                    iconBgColor: AppColors.secondaryColor.withOpacity(0.2),
                    iconColor: AppColors.secondaryColor,
                    title: context.l10n.helpCenter,
                    subtitle: context.tr(
                      'Browse common FAQs',
                      'تصفح الأسئلة الشائعة',
                    ),
                    details: const [],
                    buttonText: context.tr(
                      'Browse FAQs',
                      'تصفح الأسئلة الشائعة',
                    ),
                    buttonColor: AppColors.secondaryColor,
                    onTap: () {
                      // Open help center
                    },
                  ),
                ],
              ),
            ),

            // Other Contact Methods
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.more_horiz_rounded,
                          color: AppColors.secondaryColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        context.tr('OTHER WAYS TO CONTACT', 'طرق تواصل أخرى'),
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Phone Number
                  _buildContactMethod(
                    icon: Icons.phone_in_talk_rounded,
                    title: context.tr('Call us', 'اتصل بنا'),
                    description: context.tr(
                      'Speak directly with our support team',
                      'تحدث مباشرة مع فريق الدعم',
                    ),
                    actionText: "+1 (555) 123-4567",
                    actionIcon: Icons.phone_rounded,
                    onTap: () {
                      // Make phone call
                    },
                  ),
                  const SizedBox(height: 20),

                  // Divider
                  Container(
                    height: 1,
                    color: AppColors.greyText.withOpacity(0.1),
                  ),
                  const SizedBox(height: 20),

                  // Office Address
                  _buildContactMethod(
                    icon: Icons.business_rounded,
                    title: context.tr('Office', 'المكتب'),
                    description: context.tr(
                      'Visit our headquarters',
                      'زر مقرنا الرئيسي',
                    ),
                    actionText: "123 Tech Street, San ",
                    actionIcon: Icons.map_rounded,
                    onTap: () {
                      // Open maps
                    },
                  ),
                  const SizedBox(height: 20),

                  // Divider
                  Container(
                    height: 1,
                    color: AppColors.greyText.withOpacity(0.1),
                  ),
                  const SizedBox(height: 20),

                  // Business Hours
                  _buildContactMethod(
                    icon: Icons.access_time_rounded,
                    title: context.tr('Business Hours', 'ساعات العمل'),
                    description: context.tr(
                      'When we\'re available',
                      'مواعيد التوفر',
                    ),
                    actionText: context.tr(
                      'Mon-Fri: 9AM-6PM PST',
                      'الإثنين-الجمعة: 9ص-6م',
                    ),
                    actionIcon: Icons.schedule_rounded,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Footer Note
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                context.tr(
                  'We typically respond within 24 hours on business days',
                  'نرد عادة خلال 24 ساعة في أيام العمل',
                ),
                style: TextStyle(
                  color: AppColors.greyText.withOpacity(0.7),
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    required List<Widget> details,
    required String buttonText,
    required Color buttonColor,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.greyText.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: iconColor, size: 30),
              ),
              const SizedBox(width: 20),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: AppColors.greyText, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Details Row
          if (details.isNotEmpty) Row(children: details),

          const SizedBox(height: 20),

          // Action Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String text,
    required Color color,
    bool isStatus = false,
  }) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactMethod({
    required IconData icon,
    required String title,
    required String description,
    required String actionText,
    required IconData actionIcon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.secondaryColor, size: 24),
            ),
            const SizedBox(width: 16),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: AppColors.greyText, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        actionIcon,
                        color: AppColors.secondaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        actionText,
                        style: TextStyle(
                          color: AppColors.greyText,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Arrow
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.greyText.withOpacity(0.5),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
