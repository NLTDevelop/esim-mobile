
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class OrderSummaryDataRow extends StatelessWidget {
  const OrderSummaryDataRow({super.key, required this.data, required this.typeName, this.dataTextDecoration, this.couponWidget});

  final String typeName;
  final String data;
  final TextDecoration? dataTextDecoration;
  final Widget? couponWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultText.displayMedium(typeName, color: Theme.of(context).extension<ColorExtension>()!.descriptionText,),
              if(couponWidget != null)
                couponWidget!
            ],
          ),
          DefaultText.displayMedium(data, fontWeight: FontWeight.w600, decoration: dataTextDecoration,),
        ],
      ),
    );
  }
}
