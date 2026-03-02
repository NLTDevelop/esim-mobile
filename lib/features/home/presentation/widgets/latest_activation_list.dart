
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/activation_container.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class LatestActivationList extends StatelessWidget {
  const LatestActivationList({super.key, required this.eSims});

  final List<UserESimModel> eSims;

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
           child: const Row(
             children: [
               DefaultText.displaySmall('Latest activations', fontWeight: FontWeight.w600,),
             ],
           ),
         ),
          ...eSims.map((e) =>
              ActivationContainer(
                dataInMb: '${e.balanceMb} MB',
                description: DateFormat('MMM d yyyy').format(e.createdAt),
                title: 'Georgia ${e.mb}/MB',
                balanceInPercent: 1 - (e.usedMb / e.mb),
                isEnabled: false, onTopUp: () {  },
              )
          )
          // ...eSims.topUpHistory.map((e) =>  Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          //     decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.divider)), color: Theme.of(context).extension<ColorExtension>()!.primary.withAlpha(60)),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 30,
          //           height: 30,
          //           padding: const EdgeInsets.all(6),
          //           decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).extension<ColorExtension>()!.cardBorder),
          //           child: SvgPicture.asset(AppIcons.eSim,colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary, BlendMode.srcIn)),
          //         ),
          //         const SizedBox(width: 10,),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             DefaultText.displaySmall('Turkey ${e.mb}/MB | ${e.days}/Days', fontWeight: FontWeight.w600),
          //             const SizedBox(height: 6,),
          //             DefaultText.titleSmall(DateFormat('MMM dd yyyy jm').format(e.createdAt), color: Theme.of(context).extension<ColorExtension>()!.descriptionText,)
          //           ],
          //         ),
          //         const Spacer(),
          //         DefaultText.displaySmall('${e.price} ${e.currencyCode == 'USD' ? '\$' : '€'}', color: Theme.of(context).extension<ColorExtension>()!.primary, fontWeight: FontWeight.w500,),
          //
          //       ],
          //     )
          // )),
        ],
      ),
    );
  }
}
