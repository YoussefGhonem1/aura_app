import 'package:flutter/material.dart';

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Stocks 55% - Blue
    paint.color = Colors.blue;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708,
      3.6,
      false,
      paint,
    );

    // Crypto 20% - Green
    paint.color = Colors.green;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.985,
      1.2566,
      false,
      paint,
    );

    // Bonds 15% - Purple
    paint.color = Colors.purple;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.24,
      0.9425,
      false,
      paint,
    );

    // Cash 10% - Grey
    paint.color = Colors.grey;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      4.1825,
      0.6283,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
