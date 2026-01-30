import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget lineChartWidget({
  required StockModel stock,
  required List<FlSpot> lineData,
  required int selectedTimeFrame,
  required Function(List<FlSpot>) getPriceInterval,
  required Function(int) getTimeInterval,
  required Function(double, int) getTimeLabel,
  required Function(List<FlSpot>) getMinY,
  required Function(List<FlSpot>) getMaxY,
}) {
  return Container(
    height: 200,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          show: true,
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: getTimeInterval(selectedTimeFrame),
              getTitlesWidget: (value, meta) => Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  getTimeLabel(value, selectedTimeFrame),
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.7),
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: false,
          drawVerticalLine: false,
          horizontalInterval: getPriceInterval(lineData),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: lineData,
            isCurved: true,
            color: stock.isPositive
                ? AppColors.secondaryColor
                : AppColors.errorColor,
            barWidth: 3,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: stock.isPositive
                    ? [
                        AppColors.secondaryColor.withOpacity(0.3),
                        AppColors.secondaryColor.withOpacity(0.05),
                        AppColors.primaryColor.withOpacity(0.0),
                      ]
                    : [
                        AppColors.errorColor.withOpacity(0.3),
                        AppColors.errorColor.withOpacity(0.05),
                        AppColors.primaryColor.withOpacity(0.0),
                      ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
            dotData: const FlDotData(show: false),
          ),
        ],
        minX: lineData.first.x,
        maxX: lineData.last.x,
        minY: getMinY(lineData),
        maxY: getMaxY(lineData),
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) => touchedSpots.map((spot) {
              return LineTooltipItem(
                '\$${spot.y.toStringAsFixed(2)}',
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
              );
            }).toList(),
          ),
        ),
      ),
    ),
  );
}
