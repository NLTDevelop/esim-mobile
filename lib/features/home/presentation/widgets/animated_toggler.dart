
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class AnimatedToggler extends StatelessWidget {
  const AnimatedToggler({super.key, required this.enabled, required this.onTap});

  final bool enabled;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).extension<ColorExtension>()!.addBalance.withAlpha(150)
        ),
        child: Stack(
          children: [
            Align(alignment: Alignment.center, child: DefaultText.displaySmall('Off',color: Theme.of(context).extension<ColorExtension>()!.secondaryText),),
            AnimatedPositioned(
              top: 0,
              right: 0,
              duration: const Duration(milliseconds: 700),
              child: Container(
                width: 70,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).extension<ColorExtension>()!.addBalance
                ),
                child: Center(child: DefaultText.displaySmall('On', color: Theme.of(context).extension<ColorExtension>()!.secondaryText),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
