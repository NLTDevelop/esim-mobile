
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoPlansWidget extends StatelessWidget {
  const NoPlansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DefaultText.bodyMedium('No store... yet!'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child:  DefaultText.labelMedium('Purchase a plan for it to appear', color: Theme.of(context).extension<ColorExtension>()!.text,),
            ),
            PrimaryButton(onTap: (){
              context.go(Routes.store);
            }, text: 'Explore store'),
          ],
        ),
      ),
    );
  }
}
