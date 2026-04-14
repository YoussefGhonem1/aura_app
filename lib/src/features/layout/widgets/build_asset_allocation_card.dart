import 'package:aura_app/src/features/layout/widgets/pie_chart_pointer_class.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildAssetAllocationChart(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.1)),
    ),
    child: Column(
      children: [
        _buildSectionHeader(context, context.l10n.assetAllocation),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Pie Chart (Left)
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: PieChartPainter(),
                    size: const Size(150, 150),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.total,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.greyText,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "100%",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 24),

            /// Legend (Right)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAllocationLegend(
                    context.l10n.stocks,
                    "55%",
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildAllocationLegend(
                    context.l10n.crypto,
                    "20%",
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildAllocationLegend(
                    context.l10n.bonds,
                    "15%",
                    Colors.purple,
                  ),
                  const SizedBox(height: 12),
                  _buildAllocationLegend(context.l10n.cash, "10%", Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildAllocationLegend(String label, String percentage, Color color) {
  return Row(
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
      Text(
        percentage,
        style: const TextStyle(
          color: AppColors.greyText,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget _buildSectionHeader(BuildContext context, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        title == context.l10n.currentHoldings ? context.l10n.viewAll : "...",
        style: const TextStyle(
          color: AppColors.secondaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}
