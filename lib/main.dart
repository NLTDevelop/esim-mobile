import 'dart:async';
import 'package:country_codes/country_codes.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_apple_use_case.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/localization/data/repository/localization_repository_impl.dart';
import 'package:esim_mob_app/features/localization/presentation/cubit/localization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:esim_mob_app/common/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'common/theme/app_theme.dart';
import 'common/theme/colored_palette/light_colored_palette.dart';
import 'core/utils/logger/logger.dart';
import 'features/connection_checker/bloc/connection_checker_cubit.dart';
import 'injector.dart';

void main() async =>
    runZonedGuarded(
            () async {
          WidgetsFlutterBinding.ensureInitialized();
          await baseSteps();
          await CountryCodes.init();

          FlutterError.onError =
              (details) => Logger.handle(details.exception, details.stack);
          WidgetsBinding.instance.platformDispatcher.onError =
              Logger.logPlatformDispatcherError;

          Bloc.observer = TalkerBlocObserver(
            talker: Logger.instance,
            settings: const TalkerBlocLoggerSettings(
              printStateFullData: false,
              printEventFullData: false,
            ),
          );
          runApp(const MyApp());
        }, Logger.handle
    );

// void main(){
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthentificationBloc(loginGoogleUseCase: injector<LoginGoogleUseCase>(), loginAppleUseCase: injector<LoginAppleUseCase>()),
        ),
        BlocProvider(create: (context) =>
        ConnectionCheckerCubit()
          ..recheckConnection()),
        BlocProvider(create: (context) => LocalizationCubit(injector<LocalizationRepositoryImpl>())),
      ],
      child: BlocBuilder<LocalizationCubit, String>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'eSIM app',
            themeMode: ThemeMode.light,
            theme: createTheme(LightColoredPalette()),
            routerConfig: AppRouter().router,
            locale: Locale(context.watch<LocalizationCubit>().state),
            localizationsDelegates: const [
            ],
          );
        },
      ),
    );
  }
}




