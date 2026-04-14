import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/layout/models/alerts_model.dart';
import 'package:aura_app/src/features/layout/widgets/build_alert_card.dart';
import 'package:flutter/material.dart';

Widget buildAlertsList(BuildContext context) {
  final List<HighVolatilityAlert> examples = [
    HighVolatilityAlert(
      symbol: 'GME',
      title: context.l10n.unusualVolumeDetected,
      subtitle: context.l10n.volumeAboveAverage,
      alertLabel: context.l10n.alert,
    ),
  ];

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
