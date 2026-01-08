import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/bottom_sheets/auto_top_up_info_bottom_sheet.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
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
          decoration: BoxDecoration(color: Theme.of(context).extension<ColorExtension>()!.toggleCircle),
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
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                            image: AssetImage(AppImages.logoTransparent),
                            fit: BoxFit.cover)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 9, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Theme.of(context).extension<ColorExtension>()!.background),
                  child: Row(
                    children: [
                      DefaultText.displaySmall('eSIM #1 not installed',
                          color: Theme.of(context)
                              .extension<ColorExtension>()!
                              .text),
                    ],
                  ),
                ),
                SizedBox(
                  width: 56,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const HomeEvent.installFirstESim());
                    },
                    child: Container(
                      width: 35,
                      height: 35,
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
                        Theme.of(context).extension<ColorExtension>()!.toggleCircle,
                  ),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      // final activeESims = state.user.userTariffs
                      //     .where((e) => true)
                      //     .map((e) => e)
                      //     .toList();
                      // final currentESim = activeESims.isEmpty
                      //     ? state.user.userTariffs.last
                      //     : activeESims.last;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
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
                                    AppIcons.japan,
                                    colorFilter:  AppIcons.japan == AppIcons.world ? ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.background, BlendMode.srcIn) : null,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              DefaultText.bodySmall('Test',
                                  color: Theme.of(context)
                                      .extension<ColorExtension>()!
                                      .secondaryText),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          DefaultText.bodyMedium('${(state.tariffs.last.dataInMb / 1024).toStringAsFixed(2)} GB',
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText),
                          const SizedBox(
                            height: 28,
                          ),
                          if(state.tariffs.last.validDays != null)
                            DefaultText.labelMedium(
                            'Due to ${DateFormat('d MMM').format(DateTime.now().add(Duration(days: state.tariffs.last.validDays!)))}',
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
                              Expanded(
                                  child: HomeTextButton(
                                key: bloc.autoTopUpButtonKey,
                                text: 'Auto top-up',
                                iconPath: AppIcons.autoTopUp,
                                onPressed: () {
                                  _showAutoTopUpBottomSheet(context);
                                },
                              )),
                              Expanded(
                                  child: HomeTextButton(
                                key: bloc.installESimButtonKey,
                                text: 'Install eSIM',
                                iconPath: AppIcons.install,
                                onPressed: () {
                                  _showInstallESimBottomSheet(context);
                                },
                              )),
                              Expanded(
                                  child: HomeTextButton(
                                key: bloc.myESimsButtonKey,
                                text: 'My eSIMs',
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
        builder: (ctx) =>  HomeMyESimsBottomSheet(
          esim: context.read<HomeBloc>().userESims.first
        ));
  }

  void _showInstallESimBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => BlocProvider(
              create: (ctx) => InstallESimCubit(title: 'eSIM #1', userESims: context.read<HomeBloc>().userESims),
              child: const InstallESimBottomSheet(title: 'eSIM #1'),
            ));
  }
}
