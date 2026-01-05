

import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InstallESimChoseESim extends StatelessWidget {
  const InstallESimChoseESim({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const DefaultText.bodySmall('Select or add eSIM'),
        const SizedBox(
          height: 10,
        ),
        Bounce(
          duration: const Duration(milliseconds: 300),
          onPressed: (){
            context.read<InstallESimCubit>().chooseESim(0);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.eSim, width: 32, height: 32, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary,BlendMode.srcIn),),
                const SizedBox(
                  width: 12,
                ),
                const DefaultText.bodySmall('eSIM # 1'),
                const SizedBox(width: 12,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).extension<ColorExtension>()!.cardBorder
                  ),
                  child: DefaultText.labelSmall('not Installed'),
                ),
                const Spacer(),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 4),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Bounce(
          duration: const Duration(milliseconds: 300),
          onPressed: (){
            context.read<InstallESimCubit>().chooseESim(0);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.eSim, width: 32, height: 32, colorFilter: ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.primary,BlendMode.srcIn),),
                const SizedBox(
                  width: 12,
                ),
                const DefaultText.bodySmall('eSIM # 2'),
                const SizedBox(width: 12,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).extension<ColorExtension>()!.cardBorder
                  ),
                  child: DefaultText.labelSmall('Installed'),
                ),
                const Spacer(),
                Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).extension<ColorExtension>()!.primary
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Bounce(
          onPressed: (){
            context.pop();
            context.go(Routes.store);
          },
          duration: const Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 2),
            ),
            child: Row(
              children: [
                Icon(Icons.add, size: 26, color: Theme.of(context).extension<ColorExtension>()!.primary),
                const SizedBox(width: 14,),
                const DefaultText.bodySmall('Add new eSIM')
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const DefaultText.displayMedium('You can top-up existing eSIM with any destination data plan. Getting a new eSIM comes in handy if you want to use the same Awinst Connect account for multple eSIMs.'),
      ],
    );
  }
}
