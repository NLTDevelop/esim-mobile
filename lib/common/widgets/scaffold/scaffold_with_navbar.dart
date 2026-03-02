import 'dart:io';

import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/features/connection_checker/widgets/network_checker_widget.dart';
import 'package:esim_mob_app/features/esim_compatability_checker/presentation/cubit/esim_installation_checker_cubit.dart';
import 'package:esim_mob_app/features/esim_compatability_checker/presentation/widgets/cant_install_esim_container.dart';
import 'package:esim_mob_app/features/localization/data/model/local_keys_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  late final ValueNotifier<int> _index;

  @override
  void initState() {
    super.initState();
    // context.read<NotificationBloc>().add(const NotificationEvent.fetchNotification());

    _index = ValueNotifier(widget.navigationShell.currentIndex);
  }

  @override
  void didUpdateWidget(covariant ScaffoldWithNavBar oldWidget) {
    if (widget.navigationShell.currentIndex != _index.value) {
      _index.value = widget.navigationShell.currentIndex;
    }
    // _showPaymentModal();
    super.didUpdateWidget(oldWidget);
  }

  // void _showPaymentModal() {
  //   final currentRoute = GoRouter.of(context).routeInformationProvider.value.uri.path;
  //   if (!context.read<AuthenticationBloc>().state.user.isNeedShowModalPayment && currentRoute != Routes.payment) {
  //     context.read<PaymentModalCubit>().readLoginTime();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: MaterialApp.createMaterialHeroController(),
      child: Scaffold(
        body: NetworkCheckerWidget(connectedChild:  BlocBuilder<EsimInstallationCheckerCubit, EsimInstallationCheckerState>(
          builder: (context, state) {
            return state.canInstallESim ? widget.navigationShell : Stack(
              children: [
                widget.navigationShell,
                Align(
                  alignment: Alignment.topCenter,
                  child: CantInstallEsimContainer(),
                )
              ],
            );
          }
        )),
        bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _index,
          builder: (BuildContext context, int selectedIndex, Widget? child) => NavigationBar(
            height: Platform.isIOS ? 58.0 : 76.0,
            selectedIndex: selectedIndex,
            backgroundColor: Theme.of(context).extension<ColorExtension>()!.onBackground.withAlpha(20),
            onDestinationSelected: _onTap,
            destinations: [
              NavigationDestination(
                icon: BottomNavigationIcon(
                  asset: AppIcons.home,
                  isSelected: selectedIndex == 0,
                  label: LocaleKeys.home.tr(context),
                ),
                label: LocaleKeys.home.tr(context),
              ),
              NavigationDestination(
                icon: BottomNavigationIcon(
                  asset: AppIcons.credits,
                  isSelected: selectedIndex == 1,
                  label: LocaleKeys.store.tr(context),
                ),
                label:  LocaleKeys.store.tr(context),
              ),
              NavigationDestination(
                icon: BottomNavigationIcon(
                  asset: AppIcons.help,
                  isSelected: selectedIndex == 2,
                  label: LocaleKeys.help.tr(context),
                ),
                label: LocaleKeys.help.tr(context),
              ),
              NavigationDestination(
                icon: BottomNavigationIcon(
                  asset: AppIcons.profile,
                  isSelected: selectedIndex == 3,
                  label: LocaleKeys.profile.tr(context),
                ),
                label: LocaleKeys.profile.tr(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(int index) {
    if (index == _index.value) return;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    _index.value = index;
    // _openScreen(index);
  }
}

class BottomNavigationIcon extends StatelessWidget {
  const BottomNavigationIcon({
    super.key,
    required this.isSelected,
    required this.asset,
    required this.label,
  });

  final bool isSelected;
  final String asset;
  final String label;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(
        asset,
        width: 25,
        height: 25,
        colorFilter: ColorFilter.mode(isSelected ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor! : (Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme?.color ?? Colors.transparent), BlendMode.srcIn),
      ),
    ],
  );
}
