import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/bottom_sheets/auto_top_up_info_bottom_sheet.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/history_transaction_container.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_my_esims_bottom_sheet.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_text_button.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/bottom_sheets/install_esim_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeESimWidget extends StatelessWidget {
  const HomeESimWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).extension<ColorExtension>()!.splashBackground),
          child: Padding(
            padding: EdgeInsets.only(left: 14, right: 14, top: MediaQuery.of(context).padding.top ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _showInstallESimBottomSheet(context);
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            image: AssetImage(AppImages.logo),
                            fit: BoxFit.cover)),
                  ),
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
                        margin:
                        const EdgeInsets.symmetric(horizontal: 10),
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
                SizedBox(
                  width: 56,
                  child: InkWell(
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
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30),
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).extension<ColorExtension>()!.splashBackground,
                  ),
                  child: BlocBuilder<AuthentificationBloc, AuthentificationState>(
                    builder: (context, state) {
                      final activeESims = state.user.userTariffs
                          .where((e) => e.eSim.isActive)
                          .map((e) => e.eSim)
                          .toList();
                      final currentESim = activeESims.isEmpty
                          ? state.user.userTariffs.last.eSim
                          : activeESims.last;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration:
                                      const BoxDecoration(shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    currentESim.iconPath,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              DefaultText.bodySmall(currentESim.name,
                                  color: Theme.of(context)
                                      .extension<ColorExtension>()!
                                      .secondaryText),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          DefaultText.bodyMedium('${currentESim.dataInGB} GB',
                              color: Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText),
                          const SizedBox(
                            height: 28,
                          ),
                          DefaultText.labelMedium(
                            'Due to ${DateFormat('d MMM').format(currentESim.createdAt.add(Duration(days: currentESim.days)))}',
                            color: Theme.of(context)
                                .extension<ColorExtension>()!
                                .cardBorder,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                  child: HomeTextButton(
                                key: bloc.autoTopUpButtonKey,
                                text: 'Auto top-up',
                                iconPath: AppIcons.autoTopUp,
                                onPressed: () {
                                  _showAutoTopUpBottomSheet(context);
                                },
                              )),
                              Flexible(
                                  child: HomeTextButton(
                                key: bloc.installESimButtonKey,
                                text: 'Install eSIM',
                                iconPath: AppIcons.install,
                                onPressed: () {
                                  _showInstallESimBottomSheet(context);
                                },
                                isHighlight: true,
                              )),
                              Flexible(
                                  child: HomeTextButton(
                                key: bloc.myESimsButtonKey,
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
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const HistoryTransactionContainer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showAutoTopUpBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) => const AutoTopUpInfoBottomSheet());
  }

  void _showMyESimsBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => BlocProvider.value(
            value: context.read<HomeBloc>(),
            child: HomeMyESimsBottomSheet(
              tariffs:
                  context.read<AuthentificationBloc>().state.user.userTariffs,
            )));
  }

  void _showInstallESimBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => BlocProvider(
              create: (ctx) => InstallESimCubit(title: 'eSIM #1'),
              child: const InstallESimBottomSheet(title: 'eSIM #1'),
            ));
  }
}
