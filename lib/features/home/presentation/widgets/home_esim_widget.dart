import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/bottom_sheets/auto_top_up_info_bottom_sheet.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_my_esims_bottom_sheet.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeESimWidget extends StatelessWidget {
  const HomeESimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
            color:
                Theme.of(context).extension<ColorExtension>()!.splashBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                              image: AssetImage(AppImages.logo),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Theme.of(context).primaryColor),
                      child: Row(
                        children: [
                          DefaultText.bodySmall('eSIM',
                              color: Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText),
                          Container(
                            width: 3,
                            height: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .extension<ColorExtension>()!
                                    .secondaryText),
                          ),
                          DefaultText.bodySmall('#1',
                              color: Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 34,
                        height: 34,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          AppIcons.instructions,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText,
                              BlendMode.srcIn),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: SvgPicture.asset(
                        AppIcons.indonesia,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  DefaultText.bodySmall('Indonesia',
                      color: Theme.of(context)
                          .extension<ColorExtension>()!
                          .secondaryText),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              DefaultText.bodyMedium('1.00 GB',
                  color: Theme.of(context)
                      .extension<ColorExtension>()!
                      .secondaryText),
              const SizedBox(
                height: 28,
              ),
              DefaultText.labelMedium(
                'Due to 18 October',
                color:
                    Theme.of(context).extension<ColorExtension>()!.cardBorder,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: HomeTextButton(
                    text: 'Auto top-up',
                    iconPath: AppIcons.autoTopUp,
                    onPressed: () {
                      _showAutoTopUpBottomSheet(context);
                    },
                  )),
                  Flexible(
                      child: HomeTextButton(
                    text: 'Install eSIM',
                    iconPath: AppIcons.install,
                    onPressed: () {},
                        isHighlight: true,
                  )),
                  Flexible(
                      child: HomeTextButton(
                    text: 'My eSims',
                    iconPath: AppIcons.allPlans,
                    onPressed: () {
                      _showMyESimsBottomSheet(context);
                    },
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAutoTopUpBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context,useRootNavigator: true, useSafeArea: true, isScrollControlled: true, builder: (context) => const AutoTopUpInfoBottomSheet());
  }

  void _showMyESimsBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, useRootNavigator: true, useSafeArea: true, isScrollControlled: true, builder: (ctx) => BlocProvider.value(value:  context.read<HomeBloc>(),child: const HomeMyESimsBottomSheet()));
  }
}
