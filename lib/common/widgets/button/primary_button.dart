
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onTap, required this.text, this.isActive = true, this.isExpanded = false, this.icon});

  final String text;
  final Function() onTap;
  final bool isActive;
  final Widget? icon;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Bounce(
        duration: const Duration(milliseconds: 300),
        onPressed: onTap,
        child:  Container(
          width: isExpanded ? MediaQuery.of(context).size.width : null,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
              color: isActive ? Theme.of(context).primaryColor : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: isActive ? Border.all(color: Theme.of(context).extension<ColorExtension>()!.cardBorder, width: 2) : Border.all(color: Theme.of(context).extension<ColorExtension>()!.text, width: 2,)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(icon != null)
                Padding( padding: const EdgeInsets.only(right: 8), child: icon!),
              Flexible(child: DefaultText.displayMedium(text, maxLines: 2, overflow: TextOverflow.visible, color: isActive ? Theme.of(context).extension<ColorExtension>()!.secondaryText : Theme.of(context).extension<ColorExtension>()!.text, fontWeight: FontWeight.w500,textAlign: TextAlign.center,)),
            ],
          ),
        ));
  }
}
