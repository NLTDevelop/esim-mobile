import 'package:esim_mob_app/common/routes/redirect_builder.dart';
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final class RedirectIfFirstRun extends Guard {
  // matches login and signup routes
  @override
  Pattern get matchPattern => RegExp(r'^/(home)$');

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    final bool isFirstRun = injector<OnBoardingRepositoryImpl>().isFirstRun();

    if (isFirstRun) {
      return Routes.welcome;
    }

    return null;
  }
}
