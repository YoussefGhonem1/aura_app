import 'package:aura_app/src/features/layout/widgets/build_market_card.dart';
import 'package:flutter/material.dart';

Widget buildMarketOverview() {
  return SizedBox(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        // EGX 30: المؤشر الرئيسي للبورصة المصرية
        buildMarketCard("EGX 30", "30,450.50", "+1.2%", true),
        const SizedBox(width: 12),

        // EGX 70: مؤشر الأسهم الصغيرة والمتوسطة
        buildMarketCard("EGX 70", "7,820.25", "-0.4%", false),
        const SizedBox(width: 12),

        // EGX 100: المؤشر الأوسع نطاقاً
        buildMarketCard("EGX 100", "11,150.80", "+0.9%", true),
      ],
    ),
  );
}
