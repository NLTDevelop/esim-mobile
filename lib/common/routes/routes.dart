import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/add_balance/presentation/pages/add_balance_page.dart';
import 'package:esim_mob_app/features/auth/presentation/page/auth_page.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/page/auto_top_up_page.dart';
import 'package:esim_mob_app/features/checkout/presentation/pages/checkout_page.dart';
import 'package:esim_mob_app/features/contact_us/presentation/pages/contact_us_page.dart';
import 'package:esim_mob_app/features/deletion_account/presentation/pages/delete_account_page.dart';
import 'package:esim_mob_app/features/esim_list/presentation/pages/esim_list_page.dart';
import 'package:esim_mob_app/features/faq/presentation/pages/faq_page.dart';
import 'package:esim_mob_app/features/help/presentation/page/help_page.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:esim_mob_app/features/history/presentation/pages/history_page.dart';
import 'package:esim_mob_app/features/home/presentation/page/home_page.dart';
import 'package:esim_mob_app/features/payment/presentation/page/payment_web_view_page.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/page/preview_tariffs_page.dart';
import 'package:esim_mob_app/features/splash/presentation/page/splash_page.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
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
  static const history = '/history';
  static const addBalance = '/add-balance';
  static const eSimList = '/esims';
  static const deleteAccount = '/delete-account';
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
    final extra = state.extra as Map<String, dynamic>?;
    final tariffs = extra?['user_tariffs'] as List<PackageModel>? ?? [];
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
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final countryEntity = extra['country_entity'];
    final isFromWelcome = extra['is_from_welcome'] as bool? ?? false;
    final plan = extra['plan'] as PlanModel;
    return CustomTransitionPage(
      key: state.pageKey,
      child: PreviewTariffsPage(
        isFromWelcome: isFromWelcome,
        plan: plan,
        countryEntity: countryEntity is CountryModel ? countryEntity : (countryEntity as RegionModel),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context, GoRouterState state) {
  //   final extra = state.extra as Map<String, dynamic>;
  //   final country = extra['country'] as String;
  //   final iconPath = extra['icon_path'] as String;
  //   final isFromWelcome = extra['is_from_welcome'] as bool? ?? false;
  //   final tariffs = extra['tariffs'] as List<TariffModel>? ?? [];
  //   return PreviewTariffsPage(
  //     country: country,
  //     iconPath: iconPath,
  //     isFromWelcome: isFromWelcome,
  //     tariffs: tariffs,
  //   );
  // }
}


@TypedGoRoute<CheckoutRoute>(path: Routes.checkout)
class CheckoutRoute extends GoRouteData {
  const CheckoutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final tariff = extra['tariff'] as PackageModel;
    final image = extra['image'] as String;
    final country = extra['country'] as String;
    final countryCode = extra['country_code'] as String;
    final type = extra['type'] as String;

    return CheckoutPage(
      tariff: tariff,
      image: image,
      country: country,
      type: type,
      countryCode: countryCode,
    );
  }
}

@TypedGoRoute<PaymentRoute>(path: Routes.payment)
class PaymentRoute extends GoRouteData {
  const PaymentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    //final tariff = extra['tariff'] as PackageModel;
    final url = extra['url'] as String;
    final trx = extra['trx'] as String;

    return PaymentWebViewPage(
      url: url,
      trx: trx,
    );
  }
}


@TypedGoRoute<AutoTopUpRoute>(path: Routes.autoTopUp)
class AutoTopUpRoute extends GoRouteData {
  const AutoTopUpRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final int eSimId = extra['esim_id'] as int;
    final String? currencyCode = extra['currency_code'] as String?;
    return AutoTopUpPage(eSimId: eSimId, currencyCode: currencyCode,);
  }
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

@TypedGoRoute<AddBalanceRoute>(path: Routes.addBalance)
class AddBalanceRoute extends GoRouteData {
  const AddBalanceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AddBalancePage();
}

@TypedGoRoute<HistoryRoute>(path: Routes.history)
class HistoryRoute extends GoRouteData {
  const HistoryRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final transactions = extra['transactions'] as List<TransactionModel>;
    return CustomTransitionPage(
      key: state.pageKey,
      child: HistoryPage(transactions: transactions,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<ESimListRoute>(path: Routes.eSimList)
class ESimListRoute extends GoRouteData {
  const ESimListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>;
    final baseCountry = extra['country_entity'];
    final currencyType = extra['currency_type'];
    final isFromWelcome = extra['is_from_welcome'] as bool? ?? false;

    return ESimListPage(
      baseCountry: baseCountry is CountryModel ? baseCountry : (baseCountry as RegionModel),
      currencyType: currencyType,
      isFromWelcome: isFromWelcome,
    );
  }
}

@TypedGoRoute<DeleteAccountRoute>(path: Routes.deleteAccount)
class DeleteAccountRoute extends GoRouteData {
  const DeleteAccountRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DeleteAccountPage();
}
