import 'package:aura_app/src/features/layout/widgets/ai_insight_card_home.dart';
import 'package:aura_app/src/features/layout/widgets/build_header_home.dart';
import 'package:aura_app/src/features/layout/widgets/build_market_overview.dart';
import 'package:aura_app/src/features/layout/widgets/build_section_title.dart';
import 'package:aura_app/src/features/layout/widgets/build_top_ai_picks.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              buildHeader(context),
              const SizedBox(height: 25),
              buildDailyAIInsightCard(context),
              const SizedBox(height: 32),
              buildSectionTitle(
                context,
                context.tr('Market Overview', 'نظرة عامة على السوق'),
              ),
              const SizedBox(height: 8),
              buildMarketOverview(),
              const SizedBox(height: 25),
              buildSectionTitle(
                context,
                context.tr('Top AI Picks', 'أفضل اختيارات الذكاء الاصطناعي'),
              ),
              const SizedBox(height: 8),
              buildTopAIPicks(context),
              const SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }
}
