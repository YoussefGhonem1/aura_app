import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildPriceSection(StockModel stock) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        // Current Price
        Text(
          '\$${stock.currentPrice.toStringAsFixed(2)}',
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),

        // Price Change Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: stock.isPositive
                ? AppColors.accentColor.withOpacity(0.15)
                : AppColors.errorColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // hug content
            mainAxisAlignment: MainAxisAlignment.center, // center row
            crossAxisAlignment:
                CrossAxisAlignment.center, // align vertically center
            children: [
              // Arrow
              Icon(
                stock.isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                color: stock.isPositive
                    ? AppColors.accentColor
                    : AppColors.errorColor,
                size: 16,
              ),

              const SizedBox(width: 6),

              // Price Change Percent
              Text(
                '${stock.priceChange > 0 ? '+' : ''}${stock.priceChangePercent.toStringAsFixed(2)}%',
                style: TextStyle(
                  color: stock.isPositive
                      ? AppColors.accentColor
                      : AppColors.errorColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(width: 6),

              // "Today" Label
              Text(
                'Today',
                style: TextStyle(
                  color: stock.isPositive
                      ? AppColors.accentColor
                      : AppColors.errorColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
