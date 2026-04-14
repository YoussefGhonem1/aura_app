import 'package:aura_app/src/features/smart_automation/widgets/build_appbar.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/features/stocks_compare/widgets/build_alert_button.dart';
import 'package:aura_app/src/features/stocks_compare/widgets/build_ratios.dart';
import 'package:aura_app/src/features/stocks_compare/widgets/build_stock_card.dart';
import 'package:flutter/material.dart';

class StockComparisonScreen extends StatelessWidget {
  final StockModel stock1;
  final StockModel stock2;

  const StockComparisonScreen({
    super.key,
    required this.stock1,
    required this.stock2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, context.l10n.compareStocks),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: buildStockCard(context, stock1)),
                const SizedBox(width: 20),
                Expanded(child: buildStockCard(context, stock2)),
              ],
            ),

            const SizedBox(height: 32),

            // Key Ratios
            buildKeyRatios(context, stock1, stock2),

            const SizedBox(height: 40),

            // Set Price Alert Button
            alertButton(context, () {}),
          ],
        ),
      ),
    );
  }
}
