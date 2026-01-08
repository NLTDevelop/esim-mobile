
import 'dart:async';

import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class DeleteAccountCountdown extends StatefulWidget {
  final Duration initialDuration;

  const DeleteAccountCountdown({super.key, required this.initialDuration});

  @override
  _DeleteAccountCountdownState createState() => _DeleteAccountCountdownState();
}

class _DeleteAccountCountdownState extends State<DeleteAccountCountdown> {
  late Duration remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialDuration;
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime = Duration(seconds: remainingTime.inSeconds - 1);
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultText.displaySmall(
      "Try again in ${remainingTime.inMinutes}:${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}",
      textAlign: TextAlign.center,
    );
  }
}