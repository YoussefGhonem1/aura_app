import 'dart:math';
import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/features/stock_details/widgets/about_section.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_button_actions.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_head_widget.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_key_statics_section.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_linear_chart.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_price_section.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_signal_section.dart';
import 'package:aura_app/src/features/stock_details/widgets/build_time_frame_selector.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StockDetailsScreen extends StatefulWidget {
  final StockModel stock;

  const StockDetailsScreen({super.key, required this.stock});

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {
  int _selectedTimeFrame = 4;
  List<String> timeFrames = ['1D', '1W', '1M', '1Y', 'All'];

  List<FlSpot> _generateLineData(int timeFrameIndex) {
    final List<FlSpot> data = [];
    final basePrice = widget.stock.currentPrice;
    final random = Random();

    switch (timeFrameIndex) {
      case 0: // 1D
        for (int i = 0; i < 24; i++) {
          final variation =
              sin(i / 24 * 2 * pi) * (widget.stock.priceChangePercent / 100) +
              (random.nextDouble() - 0.5) * 0.01;
          data.add(FlSpot(i.toDouble(), basePrice * (1 + variation)));
        }
        break;
      case 1: // 1W
        for (int i = 0; i < 7; i++) {
          final variation =
              sin(i / 7 * 2 * pi) * (widget.stock.priceChangePercent / 100) +
              (random.nextDouble() - 0.5) * 0.02;
          data.add(FlSpot(i.toDouble(), basePrice * (1 + variation)));
        }
        break;
      case 2: // 1M
        for (int i = 0; i < 30; i += 2) {
          final variation =
              sin(i / 30 * 4 * pi) * (widget.stock.priceChangePercent / 100) +
              (random.nextDouble() - 0.5) * 0.02;
          data.add(FlSpot(i.toDouble(), basePrice * (1 + variation)));
        }
        break;
      case 3: // 1Y
        for (int i = 0; i < 12; i++) {
          final variation =
              sin(i / 12 * 2 * pi) * (widget.stock.priceChangePercent / 100) +
              (random.nextDouble() - 0.5) * 0.03;
          data.add(FlSpot(i.toDouble(), basePrice * (1 + variation)));
        }
        break;
      case 4: // All
        for (int i = 0; i < 24; i++) {
          final variation =
              sin(i / 24 * 6 * pi) * (widget.stock.priceChangePercent / 100) +
              (random.nextDouble() - 0.5) * 0.02;
          data.add(FlSpot(i.toDouble(), basePrice * (1 + variation)));
        }
        break;
    }

    return data;
  }

  Color getPriceColor(bool isPositive) =>
      isPositive ? AppColors.accentColor : AppColors.errorColor;

  Color getAuraSignalColor(String signal) {
    switch (signal.toUpperCase()) {
      case 'STRONG BUY':
        return AppColors.accentColor;
      case 'BUY':
        return AppColors.accentColor.withOpacity(0.8);
      case 'HOLD':
        return Colors.orange;
      case 'SELL':
        return AppColors.errorColor.withOpacity(0.8);
      case 'STRONG SELL':
        return AppColors.errorColor;
      default:
        return Colors.grey;
    }
  }

  double _getPriceInterval(List<FlSpot> data) {
    if (data.isEmpty) return 10.0;
    final minPrice = data.map((e) => e.y).reduce(min);
    final maxPrice = data.map((e) => e.y).reduce(max);
    return (maxPrice - minPrice) / 20;
  }

  double _getTimeInterval(int timeFrameIndex) {
    switch (timeFrameIndex) {
      case 0:
        return 3;
      case 1:
        return 1;
      case 2:
        return 5;
      case 3:
        return 2;
      case 4:
        return 4;
      default:
        return 1;
    }
  }

  String _getTimeLabel(double value, int timeFrameIndex) {
    switch (timeFrameIndex) {
      case 0:
        final hour = value.toInt();
        final period = hour >= 12 ? 'PM' : 'AM';
        final displayHour = hour % 12 == 0 ? 12 : hour % 12;
        return '$displayHour$period';
      case 1:
        final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return days[value.toInt() % days.length];
      case 2:
        return '${value.toInt() + 1}';
      case 3:
        final months = [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ];
        return months[value.toInt() % months.length];
      case 4:
        return 'Q${(value.toInt() ~/ 6) + 1}';
      default:
        return value.toStringAsFixed(0);
    }
  }

  double _getMinY(List<FlSpot> data) =>
      data.map((e) => e.y).reduce(min) * 0.985;

  double _getMaxY(List<FlSpot> data) =>
      data.map((e) => e.y).reduce(max) * 1.015;

  @override
  Widget build(BuildContext context) {
    final lineData = _generateLineData(_selectedTimeFrame);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeadWidget(context, widget.stock),
              SizedBox(height: 18),
              buildPriceSection(widget.stock),
              SizedBox(height: 22),
              timeFrameSelector(
                timeFrames: timeFrames,
                selectedIndex: _selectedTimeFrame,
                onSelect: (index) => setState(() => _selectedTimeFrame = index),
              ),
              lineChartWidget(
                stock: widget.stock,
                lineData: lineData,
                selectedTimeFrame: _selectedTimeFrame,
                getPriceInterval: _getPriceInterval,
                getTimeInterval: _getTimeInterval,
                getTimeLabel: _getTimeLabel,
                getMinY: _getMinY,
                getMaxY: _getMaxY,
              ),
              SizedBox(height: 22),
              auraSignalSection(
                context: context,
                stock: widget.stock,
                getAuraSignalColor: getAuraSignalColor,
              ),
              SizedBox(height: 22),
              keyStatisticsSection(stock: widget.stock),
              SizedBox(height: 28),
              AboutSection(stock: widget.stock),

              SizedBox(height: 60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomActions(widget.stock, context),
    );
  }
}
