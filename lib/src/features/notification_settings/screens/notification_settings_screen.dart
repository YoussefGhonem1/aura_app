import 'package:aura_app/src/features/notification_settings/widgets/build_notification_option.dart';
import 'package:aura_app/src/features/notification_settings/widgets/build_warning_messge.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool aiAlerts = true;
  bool priceVolatilityAlerts = false;

  bool marketNewsSummaries = true;
  bool dailyAIInsights = true;

  bool pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, context.l10n.notificationSettings),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TRADING ACTIVITY Section
            _buildSectionTitle(context.tr('TRADING ACTIVITY', 'نشاط التداول')),
            const SizedBox(height: 12),

            buildNotificationOption(
              title: context.tr(
                'AI Buy/Sell Alerts',
                'تنبيهات شراء/بيع الذكاء الاصطناعي',
              ),
              description: context.tr(
                'Instant alerts when Aura executes a trade',
                'تنبيهات فورية عند تنفيذ Aura لعملية تداول',
              ),
              value: aiAlerts,
              onChanged: (value) => setState(() => aiAlerts = value!),
            ),

            const SizedBox(height: 16),

            buildNotificationOption(
              title: context.tr(
                'Price Volatility Alerts',
                'تنبيهات تقلبات الأسعار',
              ),
              description: context.tr(
                'Notifications when watchlist assets move >5%',
                'إشعارات عند تحرك أصول قائمة المتابعة بأكثر من 5%',
              ),
              value: priceVolatilityAlerts,
              onChanged: (value) =>
                  setState(() => priceVolatilityAlerts = value!),
            ),

            // Divider
            Container(
              height: 1,
              color: AppColors.greyText.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 24),
            ),

            // MARKET INTELLIGENCE Section
            _buildSectionTitle(context.tr('MARKET INTELLIGENCE', 'ذكاء السوق')),
            const SizedBox(height: 12),

            buildNotificationOption(
              title: context.tr('Market News Summaries', 'ملخصات أخبار السوق'),
              description: context.tr(
                'Curated breaking news affecting your portfolio',
                'أخبار عاجلة منتقاة تؤثر على محفظتك',
              ),
              value: marketNewsSummaries,
              onChanged: (value) =>
                  setState(() => marketNewsSummaries = value!),
            ),

            const SizedBox(height: 16),

            buildNotificationOption(
              title: context.tr(
                'Daily AI Insights',
                'رؤى الذكاء الاصطناعي اليومية',
              ),
              description: context.tr(
                'Morning briefing on market predictions',
                'إحاطة صباحية بتوقعات السوق',
              ),
              value: dailyAIInsights,
              onChanged: (value) => setState(() => dailyAIInsights = value!),
            ),

            // Divider
            Container(
              height: 1,
              color: AppColors.greyText.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 24),
            ),

            // SYSTEM Section
            _buildSectionTitle(context.tr('SYSTEM', 'النظام')),
            const SizedBox(height: 12),

            buildNotificationOption(
              title: context.tr('Push Notifications', 'الإشعارات الفورية'),
              description: context.tr(
                'Master switch for all Aura alerts on this device',
                'المفتاح الرئيسي لجميع تنبيهات Aura على هذا الجهاز',
              ),
              value: pushNotifications,
              onChanged: (value) => setState(() => pushNotifications = value!),
            ),

            // Divider
            Container(
              height: 1,
              color: AppColors.greyText.withOpacity(0.3),
              margin: const EdgeInsets.symmetric(vertical: 24),
            ),

            // Warning Message
            buildWarningMessage(context),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.greyText,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}
