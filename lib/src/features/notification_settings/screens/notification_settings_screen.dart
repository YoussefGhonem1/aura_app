import 'package:aura_app/src/features/notification_settings/widgets/build_notification_option.dart';
import 'package:aura_app/src/features/notification_settings/widgets/build_warning_messge.dart';
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
      appBar: buildAppBar(context, "Notification Settings"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TRADING ACTIVITY Section
            _buildSectionTitle("TRADING ACTIVITY"),
            const SizedBox(height: 12),

            buildNotificationOption(
              title: "AI Buy/Sell Alerts",
              description: "Instant alerts when Aura executes a trade",
              value: aiAlerts,
              onChanged: (value) => setState(() => aiAlerts = value!),
            ),

            const SizedBox(height: 16),

            buildNotificationOption(
              title: "Price Volatility Alerts",
              description: "Notifications when watchlist assets move >5%",
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
            _buildSectionTitle("MARKET INTELLIGENCE"),
            const SizedBox(height: 12),

            buildNotificationOption(
              title: "Market News Summaries",
              description: "Curated breaking news affecting your portfolio",
              value: marketNewsSummaries,
              onChanged: (value) =>
                  setState(() => marketNewsSummaries = value!),
            ),

            const SizedBox(height: 16),

            buildNotificationOption(
              title: "Daily AI Insights",
              description: "Morning briefing on market predictions",
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
            _buildSectionTitle("SYSTEM"),
            const SizedBox(height: 12),

            buildNotificationOption(
              title: "Push Notifications",
              description: "Master switch for all Aura alerts on this device",
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
            buildWarningMessage(),

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
