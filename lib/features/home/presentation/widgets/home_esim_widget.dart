import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/bottom_sheets/auto_top_up_info_bottom_sheet.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/widgets/history_transaction_container.dart';
import 'package:esim_mob_app/features/home/domain/use_cases/fetch_user_esim_by_id_use_case.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_my_esims_bottom_sheet.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_text_button.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/pending_transaction_container.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/bottom_sheets/install_esim_bottom_sheet.dart';
import 'package:esim_mob_app/features/status_transaction/presentation/bloc/status_transaction_bloc.dart';
import 'package:esim_mob_app/injector.dart';
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
                InkWell(
                  onTap: () {
                    _showInstallESimBottomSheet(context, context.read<AuthentificationBloc>().state.eSimActivations.length - 1);
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
                      DefaultText.displaySmall('eSIM #${context.read<AuthentificationBloc>().state.eSimActivations.first.id} not installed',
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
                  child: BlocBuilder<AuthentificationBloc, AuthentificationState>(
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
                          BlocBuilder<StatusTransactionBloc, StatusTransactionState>(
                              builder: (context, state){
                                return state.maybeMap(orElse: () => Container(), pending: (s) => Padding(padding: const EdgeInsets.only(bottom: 12), child: PendingStatusWidget()));
                              }
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration:
                                      const BoxDecoration(shape: BoxShape.circle),
                                  child: SvgPicture.network(
                                    'https://myaccount.keepgo.com/img/flags/3x2/${state.eSimActivations.first.country.toLowerCase()}.svg',
                                    colorFilter:  AppIcons.japan == AppIcons.world ? ColorFilter.mode(Theme.of(context).extension<ColorExtension>()!.background, BlendMode.srcIn) : null,
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              DefaultText.bodySmall(state.eSimActivations.first.country,
                                  color: Theme.of(context)
                                      .extension<ColorExtension>()!
                                      .secondaryText),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          DefaultText.bodyMedium(state.eSimActivations.first.balanceMb != null ? '${(state.eSimActivations.first.balanceMb! / 1024.00).toStringAsFixed(2)} GB' : '',
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText),
                          const SizedBox(
                            height: 28,
                          ),
                          if(state.eSimActivations.first.days != null)
                            DefaultText.labelMedium(
                      state.eSimActivations.first.balanceDays != null ? state.eSimActivations.first.balanceDays != 0 ?
                      'Due to ${DateFormat('d MMM').format(DateTime.now().add(Duration(days: state.eSimActivations.first.balanceDays!)))}' : 'eSIM expired' : '',
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
                                  _showInstallESimBottomSheet(context, state.eSimActivations.length - 1);
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
        builder: (ctx) => AutoTopUpInfoBottomSheet(eSimId: context.read<AuthentificationBloc>().state.eSimActivations.first.id, currencyCode: context.read<AuthentificationBloc>().state.user.when(authenticated: (s) => s.currency, notAuthenticated: () => null),));
  }

  void _showMyESimsBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) =>  HomeMyESimsBottomSheet(
          esims: context.read<AuthentificationBloc>().state.eSimActivations
        ));
  }

  void _showInstallESimBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (ctx) => BlocProvider(
              create: (ctx) => InstallESimCubit( userESims: context.read<AuthentificationBloc>().state.eSimActivations, fetchUserESimByIdUseCase: injector<FetchUserESimByIdUseCase>()),
              child: InstallESimBottomSheet(),
            ));
  }
}
