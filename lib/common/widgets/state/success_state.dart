

import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:flutter/material.dart';

class SuccessState extends StatefulWidget {
  const SuccessState({super.key, this.dimension = 88});

  final double dimension;

  @override
  State<SuccessState> createState() => _SuccessStateState();
}

class _SuccessStateState extends State<SuccessState> {
  bool _isStartAnimation = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isStartAnimation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(width: widget.dimension, height: widget.dimension, duration: const Duration(milliseconds: 600), decoration: BoxDecoration(image: _isStartAnimation ? const DecorationImage(image: AssetImage(AppImages.successCheck), fit: BoxFit.cover) : null),),
    );
  }
}
