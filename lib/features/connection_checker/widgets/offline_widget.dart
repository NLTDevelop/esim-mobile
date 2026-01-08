
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle
              ),
              child: SvgPicture.asset(AppIcons.offline),
            ), Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultText.bodySmall('No internet', color: Theme.of(context).extension<ColorExtension>()!.text,),
                  const SizedBox(height: 16,),
                  DefaultText.titleLarge('You need to be online to access the app. But you can still check the instructions on how to use your eSim.', textAlign: TextAlign.center, color: Theme.of(context).extension<ColorExtension>()!.text,
                  )
                ],
              ),
              PrimaryButton(onTap: (){}, text: 'View instructions'),
              const SizedBox(
                height: 20,
              ),
            ]
        ),
      ),
    );
  }
}
