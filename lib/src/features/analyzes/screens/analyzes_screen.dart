import 'package:aura_app/src/features/analyzes/widgets/build_ai_analysis_card.dart';
import 'package:aura_app/src/features/analyzes/widgets/build_sector_item.dart';
import 'package:aura_app/src/features/analyzes/widgets/build_sentiment_gauge.dart';
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
        "Analyzes",
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
            sentimentGauge(),
            const SizedBox(height: 24),
            aiAnalysisCard(),
            const SizedBox(height: 24),
            _sectorHeader(),
            const SizedBox(height: 12),
            sectorItem(
              icon: Icons.computer,
              title: "Technology",
              status: "Very Bullish",
              value: 0.8,
              color: AppColors.secondaryColor,
            ),
            const SizedBox(height: 12),
            sectorItem(
              icon: Icons.flash_on,
              title: "Energy",
              status: "Neutral",
              value: 0.45,
              color: Colors.purpleAccent,
            ),
            const SizedBox(height: 12),
            sectorItem(
              icon: Icons.account_balance,
              title: "Finance",
              status: "Cautious",
              value: 0.3,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectorHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Sector Sentiment",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
