import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/auth/presentation/page/auth_page.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/page/auto_top_up_page.dart';
import 'package:esim_mob_app/features/checkout/presentation/pages/checkout_page.dart';
import 'package:esim_mob_app/features/contact_us/presentation/pages/contact_us_page.dart';
import 'package:esim_mob_app/features/credits/presentation/page/credits_page.dart';
import 'package:esim_mob_app/features/faq/presentation/pages/faq_page.dart';
import 'package:esim_mob_app/features/help/presentation/page/help_page.dart';
import 'package:esim_mob_app/features/home/presentation/page/home_page.dart';
import 'package:esim_mob_app/features/payment/presentation/page/payment_page.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/page/preview_tariffs_page.dart';
import 'package:esim_mob_app/features/splash/presentation/page/splash_page.dart';
import 'package:esim_mob_app/features/store/presentation/page/store_page.dart';
import 'package:esim_mob_app/features/welcome/presentation/page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../features/profile/presentation/page/profile_page.dart';
import '../widgets/scaffold/scaffold_with_navbar.dart';

part 'routes.g.dart';

class Routes {
  static const splash = '/splash';
  static const main = '/';
  static const home = '/home';
  static const welcome = '/welcome';
  static const logger = '/logger';
  static const profile = '/profile';
  static const help = '/help';
  static const credits = '/credits';
  static const store = '/store';
  static const tariffs = '/tariff';
  static const onboarding = '/onboarding';
  static const auth = '/auth';
  static const autoTopUp = '/auto-top-up';
  static const contactUs = '/contact-us';
  static const faq = '/faq';
  static const checkout = '/checkout';
  static const payment = '/payment';
  static const welcomeStore = '/welcome-store';
}

class BranchHomeData extends StatefulShellBranchData {
  const BranchHomeData();
}

class BranchStoreData extends StatefulShellBranchData {
  const BranchStoreData();
}

class BranchHelpData extends StatefulShellBranchData {
  const BranchHelpData();
}

class BranchProfileData extends StatefulShellBranchData {
  const BranchProfileData();
}


@TypedStatefulShellRoute<BottomNavigationShellRoute>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchHomeData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(path: Routes.home),
      ],
    ),
    TypedStatefulShellBranch<BranchStoreData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<StoreRoute>(path: Routes.store),
      ],
    ),
    TypedStatefulShellBranch<BranchHelpData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HelpRoute>(path: Routes.help),
      ],
    ),
    TypedStatefulShellBranch<BranchProfileData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(path: Routes.profile),
      ],
    ),
  ],
)

class BottomNavigationShellRoute extends StatefulShellRouteData {
  const BottomNavigationShellRoute();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) =>
      ScaffoldWithNavBar(navigationShell: navigationShell);
}

@TypedGoRoute<HomeRoute>(path: Routes.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final tariffs = extra['user_tariffs'] as List<TariffModel>? ?? [];
    return HomePage(
      userTariffs: tariffs,
    );
  }
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

@TypedGoRoute<StoreRoute>(path: Routes.store)
class StoreRoute extends GoRouteData {
  const StoreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StorePage();
}


@TypedGoRoute<WelcomeRoute>(path: Routes.welcome)
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const WelcomePage();
}

@TypedGoRoute<WelcomeStoreRoute>(path: Routes.welcomeStore)
class WelcomeStoreRoute extends GoRouteData {
  const WelcomeStoreRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StorePage(isFromWelcome: true,);
}


@TypedGoRoute<AuthRoute>(path: Routes.auth)
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthPage();
}



@TypedGoRoute<PreviewTariffsRoute>(path: Routes.tariffs)
class PreviewTariffsRoute extends GoRouteData {
  const PreviewTariffsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final country = extra['country'] as String;
    final iconPath = extra['icon_path'] as String;
    final isFromWelcome = extra['is_from_welcome'] as bool? ?? false;
    return PreviewTariffsPage(
      country: country,
      iconPath: iconPath,
      isFromWelcome: isFromWelcome,
    );
  }
}


@TypedGoRoute<CheckoutRoute>(path: Routes.checkout)
class CheckoutRoute extends GoRouteData {
  const CheckoutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final tariff = extra['tariff'] as TariffModel;
    return CheckoutPage(
      tariff: tariff,
    );
  }
}

@TypedGoRoute<PaymentRoute>(path: Routes.payment)
class PaymentRoute extends GoRouteData {
  const PaymentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final tariff = extra['tariff'] as TariffModel;
    return PaymentPage(
      tariffModel: tariff,
    );
  }
}


@TypedGoRoute<AutoTopUpRoute>(path: Routes.autoTopUp)
class AutoTopUpRoute extends GoRouteData {
  const AutoTopUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AutoTopUpPage();
}


@TypedGoRoute<ContactUsRoute>(path: Routes.contactUs)
class ContactUsRoute extends GoRouteData {
  const ContactUsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ContactUsPage();
}

@TypedGoRoute<FaqRoute>(path: Routes.faq)
class FaqRoute extends GoRouteData {
  const FaqRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => FaqPage();
}

