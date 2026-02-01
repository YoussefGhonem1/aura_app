import 'dart:math';
import 'package:flutter/material.dart';
import 'package:aura_app/src/shared/themes/app_colors.dart';

// StatefulWidget بدلاً من function
class MainAICard extends StatefulWidget {
  const MainAICard({super.key});

  @override
  State<MainAICard> createState() => _MainAICardState();
}

class _MainAICardState extends State<MainAICard> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;
  late AnimationController _animationControllerChart;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationControllerChart = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerChart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardColor.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.22),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _AnimatedBackgroundPainter(
                      _animationControllerChart.value,
                    ),
                  );
                },
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AI PICK OF THE DAY
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColors.secondaryColor.withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.secondaryColor,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "AI PICK OF THE DAY",
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animationController.value * 2 * pi,
                        child: Icon(
                          Icons.auto_awesome,
                          color: AppColors.secondaryColor,
                          size: 22,
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 120),

              // STRONG BUY SIGNAL
              Row(
                children: [
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.accentColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.trending_up_rounded,
                            color: AppColors.accentColor,
                            size: 18,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Strong Buy Signal",
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // NVIDIA CORP
              Text(
                "NVIDIA Corp",
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Text(
                    "(NVDA)",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "+4.2%",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.accentColor,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.arrow_upward,
                    color: AppColors.accentColor,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AI Confidence Score",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "99%",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              final pulse =
                                  0.5 +
                                  0.5 *
                                      sin(_animationController.value * 2 * pi);
                              return Container(
                                width: 8 + pulse * 2,
                                height: 8 + pulse * 2,
                                decoration: BoxDecoration(
                                  color: AppColors.accentColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.accentColor.withOpacity(
                                        0.5,
                                      ),
                                      blurRadius: pulse * 4,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Bullish",
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: Container(
                          height: 44,
                          width: 170,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.secondaryColor,
                                AppColors.primaryColor.withOpacity(0.6),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.secondaryColor.withOpacity(
                                  0.4,
                                ),
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(12),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedBuilder(
                                      animation: _animationController,
                                      builder: (context, child) {
                                        return Transform.rotate(
                                          angle:
                                              _animationController.value * 0.2,
                                          child: Icon(
                                            Icons.analytics_outlined,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      "View Analysis",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AnimatedBackgroundPainter extends CustomPainter {
  final double animationValue;

  _AnimatedBackgroundPainter(this.animationValue);

  final Paint _gridPaint = Paint()
    ..color = Colors.white.withOpacity(0.03)
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final spacing = 40.0;
    final gridSpeed = 50.0;

    final offsetX = (animationValue * gridSpeed) % spacing;
    final offsetY = (animationValue * gridSpeed * 0.6) % spacing;

    for (double i = -offsetY; i < size.height + spacing * 2; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), _gridPaint);
    }

    for (double i = -offsetX; i < size.width + spacing * 2; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), _gridPaint);
    }

    final pointSpeed = 10.0;
    final pointOffset = animationValue * pointSpeed;

    for (int i = 0; i < 30; i++) {
      final baseX = (i * 37.0);
      final baseY = (i * 29.0) % size.height;

      final x = (baseX + pointOffset * 20) % (size.width * 3);
      final adjustedY = baseY * 0.7;

      final radius = 1.5 + 0.5 * sin(animationValue * 2 * pi + i * 0.5);

      final pointPaint = Paint()
        ..color = AppColors.secondaryColor.withOpacity(
          0.2 + 0.05 * sin(animationValue * 3 * pi + i * 0.7),
        )
        ..style = PaintingStyle.fill;

      if (x < size.width) {
        canvas.drawCircle(Offset(x, adjustedY), radius, pointPaint);
      }
    }

    final lineSpeed = 15.0;
    final lineOffset = animationValue * lineSpeed;

    final path = Path();
    final amplitude = 40.0;
    final frequency = 0.02;

    for (double x = -size.width; x < size.width * 2; x += 2) {
      final adjustedX = x + lineOffset * 10;
      final y =
          size.height * 0.3 +
          amplitude * sin(adjustedX * frequency) +
          8 * cos(adjustedX * frequency * 0.7);

      if (x == -size.width) {
        path.moveTo(x + size.width, y);
      } else {
        path.lineTo(x + size.width, y);
      }
    }

    final animatedLinePaint = Paint()
      ..color = AppColors.accentColor.withOpacity(0.2)
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, animatedLinePaint);

    final path2 = Path();
    for (double x = -size.width; x < size.width * 2; x += 2) {
      final adjustedX = x + lineOffset * 13;
      final y =
          size.height * 0.4 +
          amplitude * 0.7 * sin(adjustedX * frequency * 1.2) +
          5 * cos(adjustedX * frequency * 0.9);

      if (x == -size.width) {
        path2.moveTo(x + size.width, y);
      } else {
        path2.lineTo(x + size.width, y);
      }
    }

    final secondLinePaint = Paint()
      ..color = AppColors.errorColor.withOpacity(0.3)
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path2, secondLinePaint);

    final path3 = Path();
    for (double x = -size.width; x < size.width * 2; x += 2) {
      final adjustedX = x + lineOffset * 7;
      final y =
          size.height * 0.5 +
          10 * sin(adjustedX * frequency * 0.8) +
          4 * cos(adjustedX * frequency * 1.5) +
          0.08 * adjustedX; // اتجاه صاعد

      if (x == -size.width) {
        path3.moveTo(x + size.width, y);
      } else {
        path3.lineTo(x + size.width, y);
      }
    }

    final trendLinePaint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path3, trendLinePaint);

    final gradient = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          AppColors.cardColor.withOpacity(0.7),
          AppColors.cardColor,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, gradient);
  }

  @override
  bool shouldRepaint(covariant _AnimatedBackgroundPainter oldDelegate) =>
      animationValue != oldDelegate.animationValue;
}

Widget buildMainAICard(BuildContext context) {
  return const MainAICard();
}
