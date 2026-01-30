import 'dart:math';

import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/features/stocks_compare/widgets/build_alert_button.dart';
import 'package:aura_app/src/features/stocks_compare/widgets/build_ratios.dart'
    show buildKeyRatios;
import 'package:aura_app/src/features/stocks_compare/widgets/build_stock_card.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
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
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: const Text(
          "Compare",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: buildStockCard(stock1)),
                const SizedBox(width: 20),
                Expanded(child: buildStockCard(stock2)),
              ],
            ),

            const SizedBox(height: 32),

            // Key Ratios
            buildKeyRatios(stock1, stock2),

            const SizedBox(height: 40),

            // Set Price Alert Button
            alertButton(() {}),
          ],
        ),
      ),
    );
  }
}
