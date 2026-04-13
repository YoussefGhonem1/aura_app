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
              buildHeadRecommendationTextWidget(),
              const SizedBox(height: 16),
              analysisCard(),
              const SizedBox(height: 30),
              sentimentCard(),
              const SizedBox(height: 24),
              _technicalIndicator(context),
              const SizedBox(height: 12),
              _technicalGrid(context),
              const SizedBox(height: 24),
              _priceDriver(context),
              const SizedBox(height: 12),

              driverTile(
                icon: Icons.bar_chart,
                title: context.tr('Sector Momentum', 'زخم القطاع'),
                subtitle: context.tr(
                  'Tech stocks are outperforming the S&P 500 this week, creating a tailwind for AAPL.',
                  'أسهم التكنولوجيا تتفوق على مؤشر S&P 500 هذا الأسبوع مما يدعم AAPL.',
                ),
              ),

              driverTile(
                icon: Icons.volume_up,
                title: context.tr('News Volume', 'حجم الأخبار'),
                subtitle: context.tr(
                  'Mention volume has increased 200% in the last 24 hours driven by new product launches.',
                  'زاد حجم الإشارات بنسبة 200% خلال آخر 24 ساعة بسبب إطلاق منتجات جديدة.',
                ),
              ),

              driverTile(
                icon: Icons.attach_money,
                title: context.tr('Institutional Flow', 'تدفق المؤسسات'),
                subtitle: context.tr(
                  'Significant block buying detected in dark pools over the last 3 trading sessions.',
                  'تم رصد عمليات شراء كبيرة في الأسواق المظلمة خلال آخر 3 جلسات.',
                ),
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

  Widget _technicalIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr('Technical Indicators', 'المؤشرات الفنية'),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              context.tr('View Chart', 'عرض الرسم البياني'),
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
        context.tr('Price Drivers', 'محركات السعر'),
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
            subtitle: context.tr('Neutral-High', 'محايد-مرتفع'),
            valueColor: Colors.yellowAccent,
          ),
          indicatorCard(
            title: "MACD",
            value: "Crossover",
            subtitle: context.tr('Bullish Signal', 'إشارة صعودية'),
          ),
          indicatorCard(
            title: "MA (50)",
            value: "\$172.40",
            subtitle: context.tr('Above MA', 'أعلى من المتوسط'),
          ),
          indicatorCard(
            title: context.tr('VOL VOLATILITY', 'تقلب الحجم'),
            value: "+24%",
            subtitle: context.tr('High interest', 'اهتمام مرتفع'),
          ),
        ],
      ),
    );
  }
}
