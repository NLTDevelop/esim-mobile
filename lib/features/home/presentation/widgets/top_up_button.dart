
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class TopUpButton extends StatelessWidget {
  const TopUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.addBalance, width: 1),
      ),
      child: Center(child: DefaultText.displaySmall('Top up', fontWeight: FontWeight.w500, color:  Theme.of(context).extension<ColorExtension>()!.addBalance,))
    );
  }
}
