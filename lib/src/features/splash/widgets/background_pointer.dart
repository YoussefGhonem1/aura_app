import 'package:aura_app/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryColor.withOpacity(0.12) 
      ..strokeWidth = 0.5;

    double step = 50; 
    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}