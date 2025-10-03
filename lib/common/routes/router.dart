
import 'package:esim_mob_app/common/routes/redirect_builder.dart';
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppRouter {
  AppRouter._privateConstructor();

  static final AppRouter _instance = AppRouter._privateConstructor();

  factory AppRouter() {
    return _instance;
  }

  late final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: $appRoutes,
    redirect: const RedirectBuilder({}).call,
    observers: [
      TalkerRouteObserver(Logger.instance),
    ],
    // redirect: [],
  );
}

void popUntil<T extends Object?>(String location, [T? result]) =>
    _popUntilRouter(AppRouter().router, location, result);

extension GoRouterExtension on GoRouter {
  void popUntil<T extends Object?>(String location, [T? result]) =>
      _popUntilRouter(this, location, result);
}

void _popUntilRouter<T extends Object?>(GoRouter goRouter, String location,
    [T? result]) async {
  final matches = goRouter.routerDelegate.currentConfiguration.matches;
  String currentRoute =
      goRouter.routerDelegate.currentConfiguration.last.matchedLocation;

  int count = matches.length - 1;

  bool isStackHasMatch = false;
  for (var routeMatch in matches) {
    if (routeMatch.matchedLocation == location) {
      isStackHasMatch = true;
      break;
    }
  }

  assert(isStackHasMatch, 'Location should be in stack');
  assert(location.isNotEmpty, 'Location should not be empty');
  assert(
  location != currentRoute, 'Location should not be the same as current');
  assert(location != '/', 'Location should not be the same as splash page');
  while (currentRoute != location && count < matches.length) {
    currentRoute = matches[count].matchedLocation;
    if (!goRouter.canPop() || currentRoute == location || count < 0) {
      return;
    }
    debugPrint('Popping $currentRoute');
    // In Version GoRouter > 13  we need to add a delay to avoid the error
    await Future.delayed(
        const Duration(milliseconds: 000), () => goRouter.pop(result));
    count--;
  }
}

extension ContextNavigationExtension on BuildContext {
  void popUntil<T extends Object?>(String location, [T? result]) {
    final goRouter = GoRouter.of(this);
    _popUntilRouter(goRouter, location, result);
  }
}
