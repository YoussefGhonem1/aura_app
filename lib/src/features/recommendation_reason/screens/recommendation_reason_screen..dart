import 'package:aura_app/src/features/recommendation_reason/widgets/build_analysis_card.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_button_bar.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_driver_tile.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_head.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_recommendation_text.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/build_sentiment_card.dart';
import 'package:aura_app/src/features/recommendation_reason/widgets/buils_indicator_card.dart';
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
              buildHeadRecommendationTextWidget(),
              const SizedBox(height: 16),
              analysisCard(),
              const SizedBox(height: 30),
              sentimentCard(),
              const SizedBox(height: 24),
              _technicalIndicator(),
              const SizedBox(height: 12),
              _technicalGrid(),
              const SizedBox(height: 24),
              _priceDriver(),
              const SizedBox(height: 12),

              driverTile(
                icon: Icons.bar_chart,
                title: "Sector Momentum",
                subtitle:
                    "Tech stocks are outperforming the S&P 500 this week, creating a tailwind for AAPL.",
              ),

              driverTile(
                icon: Icons.volume_up,
                title: "News Volume",
                subtitle:
                    "Mention volume has increased 200% in the last 24 hours driven by new product launches.",
              ),

              driverTile(
                icon: Icons.attach_money,
                title: "Institutional Flow",
                subtitle:
                    "Significant block buying detected in dark pools over the last 3 trading sessions.",
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      /// BOTTOM BAR
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget _technicalIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Technical Indicators",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              "View Chart",
              style: TextStyle(color: AppColors.secondaryColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceDriver() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "Price Drivers",
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// TECHNICAL GRID
  Widget _technicalGrid() {
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
            subtitle: "Neutral-High",
            valueColor: Colors.yellowAccent,
          ),
          indicatorCard(
            title: "MACD",
            value: "Crossover",
            subtitle: "Bullish Signal",
          ),
          indicatorCard(
            title: "MA (50)",
            value: "\$172.40",
            subtitle: "Above MA",
          ),
          indicatorCard(
            title: "VOL VOLATILITY",
            value: "+24%",
            subtitle: "High interest",
          ),
        ],
      ),
    );
  }
}
