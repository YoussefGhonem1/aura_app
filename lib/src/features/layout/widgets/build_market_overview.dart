import 'package:aura_app/src/features/layout/widgets/build_market_card.dart';
import 'package:flutter/material.dart';

Widget buildMarketOverview() {
  return SizedBox(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        buildMarketCard("S&P 500", "4,500.00", "+1.2%", true),
        const SizedBox(width: 12),
        buildMarketCard("Nasdaq", "14,200.00", "-0.8%", false),
        const SizedBox(width: 12),
        buildMarketCard("BTC", "65,430.00", "+0.6%", true),
      ],
    ),
  );
}
