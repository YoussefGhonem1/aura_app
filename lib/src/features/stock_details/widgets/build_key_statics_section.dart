import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget keyStatisticsSection({required StockModel stock}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Statistics',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Market Cap',
                value: '${stock.marketCap.toStringAsFixed(1)}T',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                title: 'P/E Ratio',
                value: stock.peRatio.toStringAsFixed(1),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                title: 'Div Yield',
                value: '${stock.dividendYield.toStringAsFixed(2)}%',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildStatCard(
                title: 'Avg Volume',
                value: '${stock.avgVolume.toStringAsFixed(1)}M',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildStatCard({required String title, required String value}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.white.withOpacity(0.05)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.white.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
