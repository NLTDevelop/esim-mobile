

import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class SuccessSendMessage extends StatelessWidget {
  const SuccessSendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      .toggleActive, size: 40,),
              ),
              const SizedBox(
                width: 30,
              ),
              const DefaultText.bodySmall(
                'Message was sent successfully',
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
