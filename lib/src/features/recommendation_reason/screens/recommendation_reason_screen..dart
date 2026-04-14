import 'package:aura_app/src/features/recommendation_reason/widgets/build_analysis_card.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_button_bar.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_driver_tile.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_head.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_recommendation_text.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_sentiment_card.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/buils_indicator_card.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class RecommendationReasonScreen extends StatelessWidget {
  final StockModel stock;

  const RecommendationReasonScreen({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeadRecommendationWidget(context, stock),
              SizedBox(height: 20),
              buildHeadRecommendationTextWidget(context),
              const SizedBox(height: 16),
              analysisCard(context, stock),
              const SizedBox(height: 30),
              sentimentCard(context),
              const SizedBox(height: 24),
              _technicalIndicator(context),
              const SizedBox(height: 12),
              _technicalGrid(context),
              const SizedBox(height: 24),
              _priceDriver(context),
              const SizedBox(height: 12),

              driverTile(
                icon: Icons.bar_chart,
                title: context.l10n.sectorMomentumTitle,
                subtitle: context.l10n.sectorMomentumSubtitle(stock.symbol),
              ),

              driverTile(
                icon: Icons.volume_up,
                title: context.l10n.newsVolumeTitle,
                subtitle: context.l10n.newsVolumeSubtitle,
              ),

              driverTile(
                icon: Icons.attach_money,
                title: context.l10n.institutionalFlowTitle,
                subtitle: context.l10n.institutionalFlowSubtitle,
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      /// BOTTOM BAR
      bottomNavigationBar: buildBottomBar(context, stock),
    );
  }

  Widget _technicalIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.technicalIndicators,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              context.l10n.viewChart,
              style: TextStyle(color: AppColors.secondaryColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceDriver(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        context.l10n.priceDrivers,
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// TECHNICAL GRID
  Widget _technicalGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.3,
        children: [
          indicatorCard(
            title: "RSI (14)",
            value: "65.4",
            subtitle: context.l10n.neutralHigh,
            valueColor: Colors.yellowAccent,
          ),
          indicatorCard(
            title: "MACD",
            value: "Crossover",
            subtitle: context.l10n.bullishSignal,
          ),
          indicatorCard(
            title: "MA (50)",
            value: "\$172.40",
            subtitle: context.l10n.aboveMa,
          ),
          indicatorCard(
            title: context.l10n.volVolatility,
            value: "+24%",
            subtitle: context.l10n.highInterest,
          ),
        ],
      ),
    );
  }
}
