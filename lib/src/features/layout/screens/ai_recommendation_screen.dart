import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/layout/widgets/all_picks_tabs.dart';
import 'package:aura_app/src/features/layout/widgets/build_alert_list.dart';
import 'package:aura_app/src/features/layout/widgets/build_hot_ai_signals_list.dart';
import 'package:aura_app/src/features/layout/widgets/build_section_title.dart';
import 'package:aura_app/src/features/layout/widgets/build_top_bar_recomm.dart';
import 'package:aura_app/src/features/layout/widgets/buils_high_confidence_picks.dart';
import 'package:aura_app/src/features/layout/widgets/strong_buy_recomm_card.dart';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

class AuraAIRecommendationScreen extends StatefulWidget {
  const AuraAIRecommendationScreen({super.key});

  @override
  State<AuraAIRecommendationScreen> createState() =>
      _AuraAIRecommendationScreenState();
}

class _AuraAIRecommendationScreenState
    extends State<AuraAIRecommendationScreen> {
  int _currentTabIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _currentTabIndex = index;
    });

    print("Tab changed to index: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopBar(context),
              const SizedBox(height: 24),
              buildMainAICard(context),
              const SizedBox(height: 28),
              AIPickTabs(
                initialIndex: _currentTabIndex,
                onTabChanged: _onTabChanged,
              ),
              const SizedBox(height: 20),
              buildSectionTitle(
                context,
                context.tr('High Confidence Picks', 'اختيارات عالية الثقة'),
              ),
              buildHighConfidencePicks(context),
              const SizedBox(height: 20),
              buildSectionTitle(
                context,
                context.tr('Hot AI Signals', 'إشارات AI الساخنة'),
              ),
              buildQuickPicks(),
              const SizedBox(height: 24),
              _buildHighVolatilityAlert(context),
              const SizedBox(height: 12),
              buildAlertsList(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHighVolatilityAlert(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.orange.withOpacity(0.8),
            size: 20,
          ),
          SizedBox(width: 8),
          Text(
            context.tr('High Volatility Alerts', 'تنبيهات تقلبات عالية'),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ],
  );
}
