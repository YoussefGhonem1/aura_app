import 'package:aura_app/src/features/analyzes/widgets/build_ai_analysis_card.dart';
import 'package:aura_app/src/features/analyzes/widgets/build_sector_item.dart';
import 'package:aura_app/src/features/analyzes/widgets/build_sentiment_gauge.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AnalyzesScreen extends StatelessWidget {
  const AnalyzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: buildAppBar(
        context,
        context.l10n.analyzes,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: AppColors.secondaryColor, size: 24),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            sentimentGauge(context),
            const SizedBox(height: 24),
            aiAnalysisCard(context),
            const SizedBox(height: 24),
            _sectorHeader(context),
            const SizedBox(height: 12),
            sectorItem(
              icon: Icons.computer,
              title: context.tr('Technology', 'التقنية'),
              status: context.tr('Very Bullish', 'صاعد جدًا'),
              value: 0.8,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(height: 12),
            sectorItem(
              icon: Icons.flash_on,
              title: context.tr('Energy', 'الطاقة'),
              status: context.tr('Neutral', 'محايد'),
              value: 0.45,
              color: Colors.purpleAccent,
            ),
            const SizedBox(height: 12),
            sectorItem(
              icon: Icons.account_balance,
              title: context.tr('Finance', 'المالية'),
              status: context.tr('Cautious', 'حذر'),
              value: 0.3,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectorHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.tr('Sector Sentiment', 'معنويات القطاعات'),
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          context.tr('View All', 'عرض الكل'),
          style: const TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
