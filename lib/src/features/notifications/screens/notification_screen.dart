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
                context.tr('TODAY', 'اليوم'),
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
                context.tr('YESTERDAY', 'الأمس'),
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
                  context.tr('End of notifications', 'نهاية الإشعارات'),
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
            context.tr('Mark all read', 'تحديد الكل كمقروء'),
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
          badge: "STRONG BUY",
          badgeColor: Colors.green,
          description: context.tr(
            'AI detects a bullish breakout pattern. Volume spike confirmed.',
            'اكتشف الذكاء الاصطناعي نمط اختراق صاعد. تم تأكيد ارتفاع حجم التداول.',
          ),
          match: "98% Match",
          time: "2m ago",
          icon: Icons.trending_up,
        ),
        const SizedBox(height: 16),
        alertCard(
          symbol: "NVDA",
          badge: "STOPLOSS",
          badgeColor: Colors.red,
          description: context.tr(
            'Price dropped below \$450 support level. Recommended exit.',
            'انخفض السعر أسفل مستوى الدعم 450 دولارًا. يوصى بالخروج.',
          ),
          match: "92% Match",
          time: "1h ago",
          icon: Icons.trending_down,
        ),
        const SizedBox(height: 16),
        alertCard(
          symbol: "AMD",
          badge: "VOLATILE",
          badgeColor: Colors.orange,
          description: context.tr(
            'Unusual options activity detected...',
            'تم اكتشاف نشاط غير معتاد في عقود الخيارات...',
          ),
          match: null,
          time: "4h ago",
          icon: Icons.notifications_active,
        ),
      ],
    );
  }

  Widget _disabledCardsSection() {
    return Column(
      children: [
        disabledCard(
          "SPY",
          context.tr(
            'Market closed with bearish sentiment. Moving averages crossing.',
            'أغلق السوق بمشاعر هبوطية مع تقاطع المتوسطات المتحركة.',
          ),
        ),
        SizedBox(height: 16),
        disabledCard(
          context.tr('Watchlist', 'قائمة المتابعة'),
          context.tr(
            'Weekly report available for your AI...',
            'التقرير الأسبوعي متاح لذكائك الاصطناعي...',
          ),
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
          _tabItem(context.tr('AI Alerts', 'تنبيهات الذكاء الاصطناعي'), 0),
          _tabItem(context.tr('Market News', 'أخبار السوق'), 1),
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
