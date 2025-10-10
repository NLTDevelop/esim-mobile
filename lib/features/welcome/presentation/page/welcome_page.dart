

import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      backgroundColor: Theme.of(context).extension<ColorExtension>()!.toggleCircle,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.splash, width: 250,),
              const SizedBox(
                height: 20,
              ),
               DefaultText.bodySmall('Your digital travel companion, keeping you connected around the world.', color: Theme.of(context).extension<ColorExtension>()!.secondaryText, textAlign: TextAlign.center,),
                const SizedBox(
                  height: 12,
                ),
              DefaultText.labelMedium('Pick a plan from a 190+ countries', color: Theme.of(context).extension<ColorExtension>()!.cardBorder),
              const SizedBox(
                height: 30,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                            onTap: (){},
                            text: 'Explore plans'
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onTap: (){
                            context.push(Routes.auth);
                          },
                          text: 'Login or sign up',
                          isActive: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
                    ),
          )
      ),
    );
  }
}
