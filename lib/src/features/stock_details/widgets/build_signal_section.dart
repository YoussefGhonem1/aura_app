import 'package:aura_app/src/features/stock_details/models/stock_details_model.dart';
import 'package:aura_app/src/core/extensions/localization_extension.dart';
import 'package:aura_app/src/shared/routing/route_strings.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

String _normalizeAuraSignal(String signal) {
  return signal
      .trim()
      .replaceAll(RegExp(r'[_-]+'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .toUpperCase();
}

Widget auraSignalSection({
  required StockModel stock,
  required Color Function(String) getAuraSignalColor,
  required BuildContext context,
}) {
  final normalizedSignal = _normalizeAuraSignal(stock.auraSignal);

  final String signalText = switch (normalizedSignal) {
    'STRONG BUY' => context.l10n.signalStrongBuy,
    'BUY' => context.l10n.signalBuy,
    'HOLD' => context.l10n.signalHold,
    'SELL' => context.l10n.signalSell,
    'STRONG SELL' => context.l10n.signalStrongSell,
    _ => stock.auraSignal,
  };

  final Color signalColor = getAuraSignalColor(normalizedSignal);
  double progress = stock.auraScore / 100;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
    decoration: BoxDecoration(
      color: AppColors.cardColor,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: AppColors.secondaryColor.withOpacity(0.12)),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondaryColor.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, color: AppColors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  context.l10n.auraSignal,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            /// Signal Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: signalColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: signalColor.withOpacity(0.4)),
              ),
              child: Text(
                signalText,
                style: TextStyle(
                  color: signalColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        context.l10n.scoreLabel,
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

            const SizedBox(width: 16),

            /// Confidence Text
            Expanded(
              child: Text(
                stock.auraConfidence,
                style: TextStyle(
                  color: AppColors.white.withOpacity(0.85),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 22),

        /// ===== Why Section =====
        Text(
          context.l10n.whyThisRecommendation,
          style: TextStyle(
            color: AppColors.white.withOpacity(0.5),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 14),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.check_circle, color: signalColor, size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 14,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: context.l10n.revenueGrowthPrefix),
                    TextSpan(
                      text: context.l10n.revenueGrowthValue,
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: context.l10n.revenueGrowthSuffix),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.recommendationReasonScreen,
                arguments: stock,
              );
            },
            icon: Icon(Icons.arrow_forward_ios, size: 14, color: signalColor),
            label: Text(
              context.l10n.viewFullAnalysis,
              style: TextStyle(
                color: signalColor,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ),
      ],
    ),
  );
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
