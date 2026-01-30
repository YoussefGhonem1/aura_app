import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildTrendingList({
  required List<Map<String, dynamic>> trendingStocks,
  required bool isCompareMode,
  required Color Function(int) getStockBackgroundColor,
  required Function(int) handleStockTap,
}) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: trendingStocks.length,
    itemBuilder: (context, index) {
      final stock = trendingStocks[index];
      final isSelected = stock['isSelected'] as bool;

      return GestureDetector(
        onTap: () => handleStockTap(index),
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: getStockBackgroundColor(index),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? AppColors.secondaryColor.withOpacity(0.5)
                  : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.secondaryColor
                          : AppColors.secondaryColor.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        stock['symbol'].substring(0, 1),
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.secondaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (isCompareMode)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.cardColor,
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? AppColors.secondaryColor
                              : Colors.white.withOpacity(0.5),
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 15),

              // Symbol & Name
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock['symbol'],
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      stock['name'],
                      style: TextStyle(color: AppColors.greyText, fontSize: 12),
                    ),
                  ],
                ),
              ),

              // Mini Chart (Placeholder)
              Expanded(
                flex: 2,
                child: Icon(
                  Icons.show_chart,
                  color: stock['isPositive']
                      ? AppColors.secondaryColor
                      : AppColors.errorColor,
                  size: 24,
                ),
              ),

              // Price & Change
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${stock['price']}",
                      style: const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: stock['isPositive']
                            ? AppColors.secondaryColor.withOpacity(0.15)
                            : AppColors.errorColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        stock['change'],
                        style: TextStyle(
                          color: stock['isPositive']
                              ? AppColors.secondaryColor
                              : AppColors.errorColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
