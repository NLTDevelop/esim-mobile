
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/features/splash/presentation/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      backgroundColor: Theme.of(context).extension<ColorExtension>()!.splashBackground,
      body: SplashBody(),
    );
  }
}
