

import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class CoveragesBottomSheet extends StatelessWidget {
  const CoveragesBottomSheet({super.key, required this.coverages});

  final List<String> coverages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).extension<ColorExtension>()!.background,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: DefaultText.titleLarge('Coverages')),
                ...coverages.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical:  8.0, horizontal: 14),
                  child: DefaultText.displaySmall(e, color: Theme.of(context).extension<ColorExtension>()!.text,),
                )),
              ]),
        ),
      )
    );
  }
}
