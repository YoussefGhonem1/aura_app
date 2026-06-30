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
              const SizedBox(height: 20),
              buildHeadRecommendationTextWidget(), // إذا كانت هذه الـ widget تحتاج الـ stock مرره لها أيضاً
              const SizedBox(height: 16),
              analysisCard(stock),
              const SizedBox(height: 30),
              sentimentCard(stock),
              const SizedBox(height: 24),
              _technicalIndicator(context, stock),
              const SizedBox(height: 12),
              _technicalGrid(context, stock),
              const SizedBox(height: 24),
              _priceDriver(context, stock),
              const SizedBox(height: 12),

              // بناء محركات السعر ديناميكياً من الموديل
              ...stock.priceDrivers.map((driver) {
                return driverTile(
                  icon: Icons
                      .analytics, // أيقونة افتراضية أو يمكنك تمريرها من الموديل إذا أضفتها لاحقاً
                  title: driver.title,
                  subtitle: driver.description,
                );
              }),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      /// BOTTOM BAR
      bottomNavigationBar: buildBottomBar(stock),
    );
  }

  Widget _technicalIndicator(BuildContext context, StockModel stock) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr('Technical Indicators', 'المؤشرات الفنية'),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              context.tr('View Chart', 'عرض الرسم البياني'),
              style: const TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceDriver(BuildContext context, StockModel stock) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        context.tr('Price Drivers', 'محركات السعر'),
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// TECHNICAL GRID
  Widget _technicalGrid(BuildContext context, StockModel stock) {
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
            value: stock.rsi.toStringAsFixed(1),
            subtitle: stock.rsiStatus,
            // تغيير لون الـ RSI بناءً على القيمة إذا أردت (اختياري)
            valueColor: stock.rsi > 70
                ? Colors.redAccent
                : (stock.rsi < 30 ? Colors.greenAccent : Colors.yellowAccent),
          ),
          indicatorCard(
            title: "MACD",
            value: stock.macd,
            subtitle: stock.macdStatus,
          ),
          indicatorCard(
            title: "MA (50)",
            value: stock.ma50.toStringAsFixed(2),
            subtitle: stock.ma50Status,
          ),
          indicatorCard(
            title: context.tr('VOL VOLATILITY', 'تقلب الحجم'),
            value: stock.volumeVolatility,
            subtitle: stock.volumeStatus,
          ),
        ],
      ),
    );
  }
}
