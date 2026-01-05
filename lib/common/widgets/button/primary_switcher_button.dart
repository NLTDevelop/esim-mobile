
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class PrimarySwitcherButton extends StatelessWidget {
  const PrimarySwitcherButton({super.key, required this.text, required this.onTap, required this.isActive});

  final String text;
  final Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
            color: isActive ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
        ),
        child: DefaultText.titleSmall(text, color: isActive ? Theme.of(context).extension<ColorExtension>()!.secondaryText : Theme.of(context).extension<ColorExtension>()!.text, fontWeight: FontWeight.w500,),
      ),
    );
  }
}
