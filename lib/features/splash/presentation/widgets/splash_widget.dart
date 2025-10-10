
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Image.asset(AppImages.splash,),
      ),
    );
  }
}
