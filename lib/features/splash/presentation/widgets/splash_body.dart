import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DefaultText.bodyMedium('Splash',fontWeight: FontWeight.w500,
        maxLines: 2,),
    );
  }
}
