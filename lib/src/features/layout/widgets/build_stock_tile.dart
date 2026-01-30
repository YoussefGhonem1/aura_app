import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget buildStockTile(
  String symbol,
  String name,
  String value,
  String change,
  Color iconColor, {
  List<double> chartData = const [0, 1, 2, 1.5, 2.5, 2],
  VoidCallback? onTap,
}) {
  bool isNegative = change.contains("-");
  bool isUp = !isNegative;

  return GestureDetector(
    onTap:
        onTap ??
        () {
          print('Tapped on $symbol');
          // يمكنك إضافة التنقل هنا مباشرة إذا أردت
          // Navigator.push(context, ...);
        },
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                symbol[0],
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  symbol,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.greyText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Sparkline Chart
          SizedBox(
            width: 60,
            height: 30,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: const LineTouchData(enabled: false),
                minX: 0,
                maxX: (chartData.length - 1).toDouble(),
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      chartData.length,
                      (index) => FlSpot(index.toDouble(), chartData[index]),
                    ),
                    isCurved: true,
                    barWidth: 2,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    color: isUp ? AppColors.accentColor : AppColors.errorColor,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                change,
                style: TextStyle(
                  color: isNegative
                      ? AppColors.errorColor
                      : AppColors.accentColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
