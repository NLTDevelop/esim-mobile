
import 'package:esim_mob_app/common/widgets/circular_progress_indicator/default_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key, this.value, this.textWidget, this.backgroundColor, this.dimension = 56});

  final double? value;
  final double? dimension;
  final Widget? textWidget;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(textWidget != null)
              Padding(padding: const EdgeInsets.only(bottom: 15), child: textWidget,),
            DefaultCircularProgressIndicator(dimension: dimension,value: value,),
          ],
        ),
      ),
    );
  }
}
