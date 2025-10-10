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
      $creditsRoute,
      $helpRoute,
      $storeRoute,
      $welcomeRoute,
      $authRoute,
      $previewTariffsRoute,
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

RouteBase get $creditsRoute => GoRouteData.$route(
      path: '/credits',
      factory: $CreditsRouteExtension._fromState,
    );

extension $CreditsRouteExtension on CreditsRoute {
  static CreditsRoute _fromState(GoRouterState state) => const CreditsRoute();

  String get location => GoRouteData.$location(
        '/credits',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

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
