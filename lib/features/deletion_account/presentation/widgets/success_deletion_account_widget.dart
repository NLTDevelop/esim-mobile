import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class SuccessDeletionAccountWidget extends StatelessWidget {
  const SuccessDeletionAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const DefaultText.labelMedium('Account was successfully deleted'),
        const SizedBox(height: 20,),
        Container(
    width: 80,
    height: 80,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color:
    Theme.of(context).extension<ColorExtension>()!.toggleCircle,
    shape: BoxShape.circle),
    child: Icon(Icons.check,
    color: Theme.of(context)
        .extension<ColorExtension>()!
        .toggleActive, size: 40,),),
      ],
    );
  }
}
