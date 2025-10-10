
import 'package:esim_mob_app/common/widgets/circular_progress_indicator/default_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key, this.value, this.dimension = 56});

  final double? value;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return DefaultCircularProgressIndicator(dimension: dimension,value: value,);
  }
}
