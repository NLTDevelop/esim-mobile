import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/credits/presentation/page/credits_page.dart';
import 'package:esim_mob_app/features/help/presentation/page/help_page.dart';
import 'package:esim_mob_app/features/home/presentation/page/home_page.dart';
import 'package:esim_mob_app/features/splash/presentation/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../features/profile/presentation/page/profile_page.dart';

part 'routes.g.dart';

class Routes {
  static const splash = '/splash';
  static const main = '/';
  static const home = '/home';
  static const logger = '/logger';
  static const profile = '/profile';
  static const help = '/help';
  static const credits = '/credits';
}

class BranchHomeData extends StatefulShellBranchData {
  const BranchHomeData();
}

class BranchCreditsData extends StatefulShellBranchData {
  const BranchCreditsData();
}

class BranchHelpData extends StatefulShellBranchData {
  const BranchHelpData();
}

class BranchProfileData extends StatefulShellBranchData {
  const BranchProfileData();
}


// @TypedStatefulShellRoute<BottomNavigationShellRoute>(
//   branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
//     TypedStatefulShellBranch<BranchHomeData>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<HomeRoute>(path: Routes.home),
//       ],
//     ),
//     TypedStatefulShellBranch<BranchCreditsData>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<CreditsRoute>(path: Routes.credits),
//       ],
//     ),
//     TypedStatefulShellBranch<BranchHelpData>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<HelpRoute>(path: Routes.help),
//       ],
//     ),
//     TypedStatefulShellBranch<BranchProfileData>(
//       routes: <TypedRoute<RouteData>>[
//         TypedGoRoute<ProfileRoute>(path: Routes.profile),
//       ],
//     ),
//   ],
// )
//
// class BottomNavigationShellRoute extends StatefulShellRouteData {
//   const BottomNavigationShellRoute();
//
//   @override
//   Widget builder(
//       BuildContext context,
//       GoRouterState state,
//       StatefulNavigationShell navigationShell,
//       ) =>
//       ScaffoldWithNavBar(navigationShell: navigationShell);
// }

@TypedGoRoute<HomeRoute>(path: Routes.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<LoggerRoute>(path: Routes.logger)
class LoggerRoute extends GoRouteData {
  const LoggerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => TalkerScreen(talker: Logger.instance);
}

@TypedGoRoute<SplashRoute>(path: Routes.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}



@TypedGoRoute<ProfileRoute>(path: Routes.profile)
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ProfilePage();
}

@TypedGoRoute<CreditsRoute>(path: Routes.credits)
class CreditsRoute extends GoRouteData {
  const CreditsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const CreditsPage();
}

@TypedGoRoute<HelpRoute>(path: Routes.help)
class HelpRoute extends GoRouteData {
  const HelpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HelpPage();
}