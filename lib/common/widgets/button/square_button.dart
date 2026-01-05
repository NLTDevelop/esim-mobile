
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({super.key, required this.onTap, required this.title, required this.icon});

  final Function() onTap;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).extension<ColorExtension>()!.background,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.hintText, width: 1)
            ),
            child: icon,
          ),
        ),
        const SizedBox(height: 10,),
        DefaultText.displaySmall(title, color: Theme.of(context).extension<ColorExtension>()!.toggleCircle,)
      ],
    );
  }
}
