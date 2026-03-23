import 'dart:async';
import 'package:country_codes/country_codes.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/local/session_storage.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_apple_use_case.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/deposit/domain/use_cases/fetch_last_transaction_status_use_case.dart';
import 'package:esim_mob_app/features/esim_compatability_checker/presentation/cubit/esim_installation_checker_cubit.dart';
import 'package:esim_mob_app/features/history/domain/use_cases/fetch_history_use_case.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/localization/data/repository/localization_repository_impl.dart';
import 'package:esim_mob_app/features/localization/presentation/cubit/localization_cubit.dart';
import 'package:esim_mob_app/features/notifcations/domain/use_cases/token_logout_use_case.dart';
import 'package:esim_mob_app/features/status_transaction/domain/use_cases/fetch_last_transaction_id_use_case.dart';
import 'package:esim_mob_app/features/status_transaction/presentation/bloc/status_transaction_bloc.dart';
import 'package:esim_mob_app/features/user/domain/use_cases/update_user_use_case.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:esim_mob_app/common/routes/router.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'common/theme/app_theme.dart';
import 'common/theme/colored_palette/light_colored_palette.dart';
import 'core/managers/auth_event_bus.dart';
import 'core/utils/logger/logger.dart';
import 'features/connection_checker/bloc/connection_checker_cubit.dart';
import 'injector.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseClosedHandler(RemoteMessage message) async {
  // await di.baseInit();
  // await Firebase.initializeApp(
  //   name: "design-sie",
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // injector<BackgroundNotificationParser>().parseMessage(message);
}

initNotification() async {
  await FirebaseMessaging.instance.requestPermission();

  FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
    Logger.log('A new onMessageOpenedApp event was published!');
    Logger.log(remoteMessage);
    print(remoteMessage);

    // final payloadData = _notificationService.getPayload(remoteMessage);
    // _notificationService.onTapNotification(payloadData);
  });

  // FirebaseMessaging.onBackgroundMessage((handle) {
  //   // return _notificationService.backGroundHandler(handle);
  //
  // });

  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print('On message callback');
    print(remoteMessage);
  });
}

void main() async => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await baseSteps();
      await CountryCodes.init();
      await dotenv.load(fileName: ".env");
      FlutterError.onError =
          (details) => Logger.handle(details.exception, details.stack);
      WidgetsBinding.instance.platformDispatcher.onError =
          Logger.logPlatformDispatcherError;

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await initNotification();
      FirebaseMessaging.onBackgroundMessage(_firebaseClosedHandler);

      Bloc.observer = TalkerBlocObserver(
        talker: Logger.instance,
        settings: const TalkerBlocLoggerSettings(
          printStateFullData: false,
          printEventFullData: false,
        ),
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
      SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[
          DeviceOrientation.portraitUp,
        ],
      );

      runApp(const MyApp());
    }, Logger.handle);

// void main(){
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthEventBus.instance.onLogout.listen((_) {
      if(!context.mounted){
        context.read<AuthentificationBloc>().add(AuthentificationEvent.logout());
      }
    });
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthentificationBloc(
            loginGoogleUseCase: injector<LoginGoogleUseCase>(),
            loginAppleUseCase: injector<LoginIOSUseCase>(),
            sessionStorage: injector<SessionStorage>(),
            tokenLogoutUseCase: injector<TokenLogoutUseCase>(),
            updateUserUseCase: injector<UpdateUserUseCase>(),
          ),
        ),
        BlocProvider(
            create: (context) => ConnectionCheckerCubit()..recheckConnection()),
        BlocProvider(
            create: (context) =>
                LocalizationCubit(injector<LocalizationRepositoryImpl>())),
        BlocProvider(
            create: (context) =>
                EsimInstallationCheckerCubit()..checkSupportingESim()),
        BlocProvider(
            create: (context) => StatusTransactionBloc(
                fetchLastTransactionStatusUseCase:
                    injector<FetchLastTransactionStatusUseCase>(),
                fetchLastTransactionIdUseCase:
                    injector<FetchLastTransactionIdUseCase>())),
        BlocProvider(create: (context) => HistoryBloc(fetchHistoryUseCase: injector<FetchHistoryUseCase>()))
      ],
      child: BlocBuilder<LocalizationCubit, String>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'eSIM app',
            themeMode: ThemeMode.light,
            theme: createTheme(LightColoredPalette()),
            routerConfig: AppRouter().router,
            locale: Locale(context.watch<LocalizationCubit>().state),
            localizationsDelegates: const [],
          );
        },
      ),
    );
  }
}
