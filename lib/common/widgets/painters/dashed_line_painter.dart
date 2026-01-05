
import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dashLength;
  final double dashSpace;
  final bool isVertical;
  final double mainAxisOffset;

  DashedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.dashSpace,
    this.isVertical = false,
    this.mainAxisOffset = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness <= 0 ? 1 : thickness;

    final mainAxisSize = _getMainAxisSize(size);
    final crossAxisPosition = _getCrossAxisPosition(size);

    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    double currentPosition = mainAxisOffset;

    while (currentPosition < mainAxisSize) {
      double nextDashEnd = currentPosition + dashLength;

      if (nextDashEnd > mainAxisSize) {
        nextDashEnd = mainAxisSize;
      }

      final start = _calculateStartOffset(crossAxisPosition, currentPosition);
      final end = _calculateEndOffset(crossAxisPosition, nextDashEnd);

      canvas.drawLine(start, end, paint);

      currentPosition += dashLength + dashSpace;
    }
  }

  double _getMainAxisSize(Size size) {
    return isVertical ? size.height : size.width;
  }

  double _getCrossAxisPosition(Size size) {
    return isVertical ? size.width / 2 : size.height / 2;
  }

  Offset _calculateStartOffset(
      double crossAxisPosition, double currentPosition) {
    return isVertical
        ? Offset(crossAxisPosition, currentPosition)
        : Offset(currentPosition, crossAxisPosition);
  }

  Offset _calculateEndOffset(double crossAxisPosition, double nextDashEnd) {
    return isVertical
        ? Offset(crossAxisPosition, nextDashEnd)
        : Offset(nextDashEnd, crossAxisPosition);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}