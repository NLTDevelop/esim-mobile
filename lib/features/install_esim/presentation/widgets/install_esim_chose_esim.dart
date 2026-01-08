

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
        ... context.read<InstallESimCubit>().userESims.map((e) => Padding(padding: const EdgeInsets.only(bottom: 10), child: Bounce(
          duration: const Duration(milliseconds: 300),
          onPressed: (){
            context.read<InstallESimCubit>().chooseESim(0);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                DefaultText.displaySmall('eSIM # ${e.id}'),
                const SizedBox(width: 12,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).extension<ColorExtension>()!.cardBorder
                  ),
                  child: const DefaultText.labelSmall('not Installed'),
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
        ),)),
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
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
          height: 18,
        ),
        const DefaultText.displayMedium('You can top-up existing eSIM with any destination data plan. Getting a new eSIM comes in handy if you want to use the same Awinst Connect account for multple eSIMs.'),
      ],
    );
  }
}
