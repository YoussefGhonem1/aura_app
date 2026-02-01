import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildHeadRecommendationWidget(BuildContext context, StockModel stock) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColors.white,
                  size: 18,
                ),
              ),
            ),
            // Stock Header
            Column(
              children: [
                Text(
                  "Insight Details",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${stock.symbol} • ${stock.name}.",
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_border,
                color: AppColors.white,
                size: 26,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(color: Colors.white.withOpacity(0.1), height: 0.5),
      ],
    ),
  );
}
