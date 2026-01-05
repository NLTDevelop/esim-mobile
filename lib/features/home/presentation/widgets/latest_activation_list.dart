
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class LatestActivationList extends StatelessWidget {
  const LatestActivationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: Theme.of(context).extension<ColorExtension>()!.hintText), color: Theme.of(context).extension<ColorExtension>()!.background ,boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(0, 32, 70, .15),
            offset: Offset(0, 3),
            blurRadius: 5)
      ]),
      child: Column(
        children: [
         Container(
           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
           decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.divider))),
           child: Row(
             children: [
               DefaultText.displaySmall('Latest activations', fontWeight: FontWeight.w600,),
             ],
           ),
         ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.divider)), color: Theme.of(context).extension<ColorExtension>()!.primary.withAlpha(60)),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).extension<ColorExtension>()!.cardBorder),
                  child: SvgPicture.asset(AppIcons.eSim,colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary, BlendMode.srcIn)),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText.displaySmall('Turkey 3072/MB | 30/Days', fontWeight: FontWeight.w600),
                    const SizedBox(height: 6,),
                    DefaultText.titleSmall(DateFormat('MMM dd yyyy jm').format(DateTime.now().subtract(const Duration(days: 1, hours: 3))), color: Theme.of(context).extension<ColorExtension>()!.descriptionText,)
                  ],
                ),
                const Spacer(),
                DefaultText.displaySmall('1.98 \$', color: Theme.of(context).extension<ColorExtension>()!.primary, fontWeight: FontWeight.w500,),

              ],
            )
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.divider)), color: Theme.of(context).extension<ColorExtension>()!.primary.withAlpha(60)),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).extension<ColorExtension>()!.cardBorder),
                    child: SvgPicture.asset(AppIcons.eSim, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary, BlendMode.srcIn),),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText.displaySmall('Turkey 3072/MB | 30/Days'),
                      const SizedBox(height: 6,),
                      DefaultText.titleSmall(DateFormat('MMM dd yyyy HH:mm').format(DateTime.now().subtract(const Duration(days: 1, hours: 3))), color: Theme.of(context).extension<ColorExtension>()!.descriptionText,)
                    ],
                  ),
                  const Spacer(),
                  DefaultText.displaySmall('1.98 \$', color: Theme.of(context).extension<ColorExtension>()!.primary,),

                ],
              )
          )
        ],
      ),
    );
  }
}
