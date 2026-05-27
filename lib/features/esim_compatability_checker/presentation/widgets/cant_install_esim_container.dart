
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CantInstallEsimContainer extends StatelessWidget {
  const CantInstallEsimContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ColorExtension>()!.error
      ),
      padding: EdgeInsets.only(top: 12 + MediaQuery.of(context).padding.top, left: 12, right: 12, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.info, width: 20, height: 20, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.secondaryText, BlendMode.srcIn),),
          const SizedBox(width: 14,),
          DefaultText.labelSmall('Your device does not support eSIMs', color: Theme.of(context).extension<ColorExtension>()!.secondaryText,),
        ],
      ),
    );
  }
}
