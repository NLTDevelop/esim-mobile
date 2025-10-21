
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key, this.title, this.description, this.action});

  final String? title;
  final String? description;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Theme.of(context).extension<ColorExtension>()!.background),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: DefaultText.bodyMedium(title!, letterSpacing: 0,),
            ),
          if(description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: DefaultText.bodySmall(description!,),
          ),
          if(action != null)
            action!
        ],
      ),
    );
  }
}
