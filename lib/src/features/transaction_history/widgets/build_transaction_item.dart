import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildTransactionItem({
  required BuildContext context,
  required String symbol,
  bool auraPick = false,
  required double amount,
  required String type,
  required String date,
  required String status,
  required Color statusColor,
}) {
  bool isNegative = amount < 0;
  Color amountColor = isNegative ? Colors.red : Colors.green;

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.greyText.withOpacity(0.1),
          width: 1,
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Symbol Circle
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.cardColor,
            border: Border.all(
              color: AppColors.greyText.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              symbol.length > 4 ? symbol.substring(0, 4) : symbol,
              style: TextStyle(
                color: AppColors.white,
                fontSize: symbol.length > 4 ? 10 : 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Transaction Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              symbol,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (auraPick) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.secondaryColor.withOpacity(
                                    0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  context.l10n.auraPick,
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "$type • $date",
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${isNegative ? '-' : '+'}\$${amount.abs().toStringAsFixed(2)}",
                    style: TextStyle(
                      color: amountColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
