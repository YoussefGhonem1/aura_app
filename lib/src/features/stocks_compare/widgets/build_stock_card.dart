import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/features/stocks_compare/widgets/build_ai_card.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildStockCard(StockModel stock) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.white.withOpacity(0.1)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Symbol and Name
        Text(
          stock.symbol,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          stock.name,
          style: TextStyle(
            color: AppColors.white.withOpacity(0.7),
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 20),

        // Current Price
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Current Price\n',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              TextSpan(
                text: '\$${stock.currentPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Price Change
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: stock.isPositive
                ? AppColors.accentColor.withOpacity(0.15)
                : AppColors.errorColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                stock.isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                color: stock.isPositive
                    ? AppColors.accentColor
                    : AppColors.errorColor,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                '${stock.priceChangePercent > 0 ? '+' : ''}${stock.priceChangePercent.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: stock.isPositive
                      ? AppColors.accentColor
                      : AppColors.errorColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        buildAuraAICard(
          stock,
          progress: stock.auraScore / 100,
          signalColor: _getSignalColor(stock.auraSignal),
        ),
      ],
    ),
  );
}

Color _getSignalColor(String signal) {
  switch (signal.toUpperCase()) {
    case 'STRONG BUY':
      return AppColors.accentColor;
    case 'BUY':
      return AppColors.accentColor.withOpacity(0.9);
    case 'HOLD':
      return Colors.orange;
    case 'SELL':
      return AppColors.errorColor.withOpacity(0.9);
    case 'STRONG SELL':
      return AppColors.errorColor;
    default:
      return AppColors.greyText;
  }
}
