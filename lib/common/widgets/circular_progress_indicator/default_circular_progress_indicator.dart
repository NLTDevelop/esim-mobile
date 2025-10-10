import 'package:flutter/material.dart';

class DefaultCircularProgressIndicator extends StatelessWidget {
  const DefaultCircularProgressIndicator({
    super.key,
    this.strokeWidth = 6.0,
    this.backgroundColor,
    this.strokeCap,
    this.value,
    this.dimension,
    this.color,
  });

  final double strokeWidth;
  final Color? backgroundColor;
  final StrokeCap? strokeCap;
  final double? value;
  final double? dimension;
  final Color? color;

  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox.square(
      dimension: dimension,
      child: CircularProgressIndicator(
        value: value,
        color: color,
        strokeWidth: strokeWidth,
        strokeCap: strokeCap ?? StrokeCap.round,
        backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary.withOpacity(0.10),
      ),
    ),
  );
}
