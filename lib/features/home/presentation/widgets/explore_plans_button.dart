
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class ExplorePlansButton extends StatelessWidget {
  const ExplorePlansButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DefaultText.bodyMedium('Explore store', decoration: TextDecoration.underline, decorationColor: Theme.of(context).extension<ColorExtension>()!.text,),
    );
  }
}
