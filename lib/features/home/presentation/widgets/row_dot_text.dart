
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class RowDotText extends StatelessWidget {
  const RowDotText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 2,
          height: 2,
          decoration: BoxDecoration(color: Theme.of(context).extension<ColorExtension>()!.text),
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(child: DefaultText.displaySmall(text, maxLines: 3, overflow: TextOverflow.ellipsis,)),
      ],
    );
  }
}
