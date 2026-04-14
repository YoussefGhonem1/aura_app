import 'package:aura_app/src/features/notifications/widgets/build_alert_card.dart';
import 'package:aura_app/src/features/notifications/widgets/build_displayed_card.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: _buildAppBar(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildTabs(),
              const SizedBox(height: 24),
              Text(
                context.l10n.todayLabel,
                style: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _alertsSection(),
              const SizedBox(height: 32),
              Text(
                context.l10n.yesterdayLabel,
                style: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              _disabledCardsSection(),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  context.l10n.endOfNotifications,
                  style: const TextStyle(color: AppColors.greyText),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.white,
              size: 18,
            ),
          ),
        ),
      ),
      title: Text(
        context.l10n.notifications,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            context.l10n.markAllRead,
            style: const TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _alertsSection() {
    return Column(
      children: [
        alertCard(
          symbol: "TSLA",
          badge: context.l10n.strongBuyBadge,
          badgeColor: Colors.green,
          description: context.l10n.tslaBullishBreakoutDescription,
          match: context.l10n.match98,
          time: context.l10n.time2mAgo,
          icon: Icons.trending_up,
        ),
        const SizedBox(height: 16),
        alertCard(
          symbol: "NVDA",
          badge: context.l10n.stopLossBadge,
          badgeColor: Colors.red,
          description: context.l10n.nvdaSupportBreakDescription,
          match: context.l10n.match92,
          time: context.l10n.time1hAgo,
          icon: Icons.trending_down,
        ),
        const SizedBox(height: 16),
        alertCard(
          symbol: "AMD",
          badge: context.l10n.volatileBadge,
          badgeColor: Colors.orange,
          description: context.l10n.amdOptionsActivityDescription,
          match: null,
          time: context.l10n.time4hAgo,
          icon: Icons.notifications_active,
        ),
      ],
    );
  }

  Widget _disabledCardsSection() {
    return Column(
      children: [
        disabledCard("SPY", context.l10n.marketBearishSentimentDescription),
        SizedBox(height: 16),
        disabledCard(
          context.l10n.watchlist,
          context.l10n.weeklyReportAvailable,
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _tabItem(context.l10n.aiAlertsTab, 0),
          _tabItem(context.l10n.marketNewsTab, 1),
        ],
      ),
    );
  }

  Widget _tabItem(String text, int index) {
    final isSelected = selectedTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? AppColors.primaryColor : AppColors.greyText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
