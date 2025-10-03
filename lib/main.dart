import 'dart:async';
import 'package:flutter/material.dart';
import 'package:esim_mob_app/common/routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'common/theme/app_theme.dart';
import 'common/theme/colored_palette/light_colored_palette.dart';
import 'core/utils/logger/logger.dart';
import 'injector.dart';

void main() async => runZonedGuarded(
        () async {

          WidgetsFlutterBinding.ensureInitialized();
      await baseSteps();
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
    return MaterialApp.router(
      title: 'eSIM app',
      themeMode: ThemeMode.light,
      theme: createTheme(LightColoredPalette()),
      routerConfig: AppRouter().router,
      locale: const Locale('en'),
      localizationsDelegates: const [
      ],
    );
  }
}


