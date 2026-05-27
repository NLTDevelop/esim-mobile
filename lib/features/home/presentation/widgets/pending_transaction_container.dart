import 'package:flutter/material.dart';

class PendingStatusWidget extends StatefulWidget {
  const PendingStatusWidget({super.key});

  @override
  State<PendingStatusWidget> createState() => _PendingStatusWidgetState();
}

class _PendingStatusWidgetState extends State<PendingStatusWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _dotsAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _dotsAnimation = StepTween(begin: 0, end: 3).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _dots {
    return '.' * _dotsAnimation.value;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotsAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Pending transaction$_dots',
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}