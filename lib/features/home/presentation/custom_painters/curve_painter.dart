
import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  CurvePainter({
    required this.progress,
    this.backgroundColor = const Color(0x330000FF),
    this.progressColor = Colors.blue,
  });

  final double progress;
  final Color backgroundColor;
  final Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7.0;

    final path = _buildPath(size);

    // All curve
    canvas.drawPath(path, bgPaint);

    final clamped = progress.clamp(0.0, 1.0);
    if(clamped == 0){
      return;
    }
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      final length = metric.length;
      final progressPath = metric.extractPath(0.0, length * clamped);
      canvas.drawPath(progressPath, progressPaint);
      break; // якщо path точно один сегмент — достатньо першого
    }

  }

  Path _buildPath(Size size) {
    final path = Path();
    path.moveTo(0, size.height);

    final cpX1 = size.width * 0.05;
    final cpY1 = size.height * (-0.3);
    final cpX2 = size.width * 0.95;
    final cpY2 = size.height * (-0.3);
    final epX = size.width;
    final epY = size.height;

    path.cubicTo(cpX1, cpY1, cpX2, cpY2, epX, epY);
    return path;
  }

  @override
  bool shouldRepaint(covariant CurvePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor;
  }
}
