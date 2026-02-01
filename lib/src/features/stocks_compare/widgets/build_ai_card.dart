
  import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildAuraAICard(
    StockModel stock, {
    double progress = 0.0,
    Color signalColor = Colors.grey,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.auto_awesome,
              color: AppColors.accentColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'AURA AI ',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),

        SizedBox(
          width: 84,
          height: 84,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Background Circle using CustomPaint
              CustomPaint(
                size: const Size(78, 78),
                painter: _CirclePainter(
                  progress: 1.0,
                  color: AppColors.white.withOpacity(0.1),
                  strokeWidth: 6,
                ),
              ),

              /// Progress Circle using CustomPaint
              CustomPaint(
                size: const Size(78, 78),
                painter: _CirclePainter(
                  progress: progress.clamp(0.0, 1.0),
                  color: signalColor,
                  strokeWidth: 6,
                ),
              ),

              /// Center Text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${stock.auraScore}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Score',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.6),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          decoration: BoxDecoration(
            color: _getSignalColor(stock.auraSignal).withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            stock.auraSignal,
            style: TextStyle(
              color: _getSignalColor(stock.auraSignal),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Risk: ${_getRiskLevel(stock)}',
          style: TextStyle(
            color: AppColors.white.withOpacity(0.8),
            fontSize: 14,
          ),
        ),
      ],
    );
  }Color _getSignalColor(String signal) {
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

  String _getRiskLevel(StockModel stock) {
    // Simplified risk calculation
    final absChange = stock.priceChangePercent.abs();
    if (absChange < 2) return 'Low Risk';
    if (absChange < 5) return 'Medium Risk';
    return 'High Risk';
  }


class _CirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.progress,
    required this.color,
    this.strokeWidth = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * (3.1415926535 / 180), // Start from top
      2 * 3.1415926535 * progress, // Sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}