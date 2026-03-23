// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $bottomNavigationShellRoute,
      $homeRoute,
      $loggerRoute,
      $splashRoute,
      $profileRoute,
      $helpRoute,
      $storeRoute,
      $welcomeRoute,
      $welcomeStoreRoute,
      $authRoute,
      $previewTariffsRoute,
      $checkoutRoute,
      $paymentRoute,
      $autoTopUpRoute,
      $contactUsRoute,
      $faqRoute,
      $addBalanceRoute,
      $historyRoute,
      $eSimListRoute,
      $topUpRoute,
      $deleteAccountRoute,
      $installationInstruction,
    ];

RouteBase get $bottomNavigationShellRoute => StatefulShellRouteData.$route(
      factory: $BottomNavigationShellRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomeRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/store',
              factory: $StoreRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/help',
              factory: $HelpRouteExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfileRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $BottomNavigationShellRouteExtension on BottomNavigationShellRoute {
  static BottomNavigationShellRoute _fromState(GoRouterState state) =>
      const BottomNavigationShellRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StoreRouteExtension on StoreRoute {
  static StoreRoute _fromState(GoRouterState state) => const StoreRoute();

  String get location => GoRouteData.$location(
        '/store',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HelpRouteExtension on HelpRoute {
  static HelpRoute _fromState(GoRouterState state) => const HelpRoute();

  String get location => GoRouteData.$location(
        '/help',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

RouteBase get $loggerRoute => GoRouteData.$route(
      path: '/logger',
      factory: $LoggerRouteExtension._fromState,
    );

extension $LoggerRouteExtension on LoggerRoute {
  static LoggerRoute _fromState(GoRouterState state) => const LoggerRoute();

  String get location => GoRouteData.$location(
        '/logger',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $profileRoute => GoRouteData.$route(
      path: '/profile',
      factory: $ProfileRouteExtension._fromState,
    );

RouteBase get $helpRoute => GoRouteData.$route(
      path: '/help',
      factory: $HelpRouteExtension._fromState,
    );

RouteBase get $storeRoute => GoRouteData.$route(
      path: '/store',
      factory: $StoreRouteExtension._fromState,
    );

RouteBase get $welcomeRoute => GoRouteData.$route(
      path: '/welcome',
      factory: $WelcomeRouteExtension._fromState,
    );

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => const WelcomeRoute();

  String get location => GoRouteData.$location(
        '/welcome',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $welcomeStoreRoute => GoRouteData.$route(
      path: '/welcome-store',
      factory: $WelcomeStoreRouteExtension._fromState,
    );

extension $WelcomeStoreRouteExtension on WelcomeStoreRoute {
  static WelcomeStoreRoute _fromState(GoRouterState state) =>
      const WelcomeStoreRoute();

  String get location => GoRouteData.$location(
        '/welcome-store',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authRoute => GoRouteData.$route(
      path: '/auth',
      factory: $AuthRouteExtension._fromState,
    );

extension $AuthRouteExtension on AuthRoute {
  static AuthRoute _fromState(GoRouterState state) => const AuthRoute();

  String get location => GoRouteData.$location(
        '/auth',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $previewTariffsRoute => GoRouteData.$route(
      path: '/tariff',
      factory: $PreviewTariffsRouteExtension._fromState,
    );

extension $PreviewTariffsRouteExtension on PreviewTariffsRoute {
  static PreviewTariffsRoute _fromState(GoRouterState state) =>
      const PreviewTariffsRoute();

  String get location => GoRouteData.$location(
        '/tariff',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $checkoutRoute => GoRouteData.$route(
      path: '/checkout',
      factory: $CheckoutRouteExtension._fromState,
    );

extension $CheckoutRouteExtension on CheckoutRoute {
  static CheckoutRoute _fromState(GoRouterState state) => const CheckoutRoute();

  String get location => GoRouteData.$location(
        '/checkout',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $paymentRoute => GoRouteData.$route(
      path: '/payment',
      factory: $PaymentRouteExtension._fromState,
    );

extension $PaymentRouteExtension on PaymentRoute {
  static PaymentRoute _fromState(GoRouterState state) => const PaymentRoute();

  String get location => GoRouteData.$location(
        '/payment',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $autoTopUpRoute => GoRouteData.$route(
      path: '/auto-top-up',
      factory: $AutoTopUpRouteExtension._fromState,
    );

extension $AutoTopUpRouteExtension on AutoTopUpRoute {
  static AutoTopUpRoute _fromState(GoRouterState state) =>
      const AutoTopUpRoute();

  String get location => GoRouteData.$location(
        '/auto-top-up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $contactUsRoute => GoRouteData.$route(
      path: '/contact-us',
      factory: $ContactUsRouteExtension._fromState,
    );

extension $ContactUsRouteExtension on ContactUsRoute {
  static ContactUsRoute _fromState(GoRouterState state) =>
      const ContactUsRoute();

  String get location => GoRouteData.$location(
        '/contact-us',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $faqRoute => GoRouteData.$route(
      path: '/faq',
      factory: $FaqRouteExtension._fromState,
    );

extension $FaqRouteExtension on FaqRoute {
  static FaqRoute _fromState(GoRouterState state) => const FaqRoute();

  String get location => GoRouteData.$location(
        '/faq',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $addBalanceRoute => GoRouteData.$route(
      path: '/add-balance',
      factory: $AddBalanceRouteExtension._fromState,
    );

extension $AddBalanceRouteExtension on AddBalanceRoute {
  static AddBalanceRoute _fromState(GoRouterState state) =>
      const AddBalanceRoute();

  String get location => GoRouteData.$location(
        '/add-balance',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $historyRoute => GoRouteData.$route(
      path: '/history',
      factory: $HistoryRouteExtension._fromState,
    );

extension $HistoryRouteExtension on HistoryRoute {
  static HistoryRoute _fromState(GoRouterState state) => const HistoryRoute();

  String get location => GoRouteData.$location(
        '/history',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $eSimListRoute => GoRouteData.$route(
      path: '/esims',
      factory: $ESimListRouteExtension._fromState,
    );

extension $ESimListRouteExtension on ESimListRoute {
  static ESimListRoute _fromState(GoRouterState state) => const ESimListRoute();

  String get location => GoRouteData.$location(
        '/esims',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $topUpRoute => GoRouteData.$route(
      path: '/top-up',
      factory: $TopUpRouteExtension._fromState,
    );

extension $TopUpRouteExtension on TopUpRoute {
  static TopUpRoute _fromState(GoRouterState state) => const TopUpRoute();

  String get location => GoRouteData.$location(
        '/top-up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $deleteAccountRoute => GoRouteData.$route(
      path: '/delete-account',
      factory: $DeleteAccountRouteExtension._fromState,
    );

extension $DeleteAccountRouteExtension on DeleteAccountRoute {
  static DeleteAccountRoute _fromState(GoRouterState state) =>
      const DeleteAccountRoute();

  String get location => GoRouteData.$location(
        '/delete-account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $installationInstruction => GoRouteData.$route(
      path: '/installation-instruction',
      factory: $InstallationInstructionExtension._fromState,
    );

extension $InstallationInstructionExtension on InstallationInstruction {
  static InstallationInstruction _fromState(GoRouterState state) =>
      const InstallationInstruction();

  String get location => GoRouteData.$location(
        '/installation-instruction',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
