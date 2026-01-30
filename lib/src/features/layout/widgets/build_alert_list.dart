import 'package:aura_app/src/features/layout/models/alerts_model.dart';
import 'package:aura_app/src/features/layout/widgets/build_alert_card.dart';
import 'package:flutter/material.dart';

Widget buildAlertsList() {
  return Column(
    children: examples
        .map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: buildHighVolatilityAlertCard(
              symbol: item.symbol,
              title: item.title,
              subtitle: item.subtitle,
              alertLabel: item.alertLabel,
            ),
          ),
        )
        .toList(),
  );
}

// Example data
final List<HighVolatilityAlert> examples = [
  HighVolatilityAlert(
    symbol: 'GME',
    title: 'Unusual Volume Detected',
    subtitle: 'Volume is 450% above average',
    alertLabel: 'ALERT',
  ),
  // HighVolatilityAlert(
  //   symbol: 'NVDA',
  //   title: 'High Volatility Alert',
  //   subtitle: 'Price swing of 5.2% in 15 minutes',
  //   alertLabel: 'HIGH RISK',
  // ),
  // HighVolatilityAlert(
  //   symbol: 'TSLA',
  //   title: 'Earnings Surprise',
  //   subtitle: 'Unexpected earnings announcement',
  //   alertLabel: 'BREAKING',
  // ),
  // HighVolatilityAlert(
  //   symbol: 'AAPL',
  //   title: 'Unusual Options Activity',
  //   subtitle: 'Large block trades detected',
  //   alertLabel: 'WATCH',
  // ),
];
