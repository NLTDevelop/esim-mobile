import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpInfoBottomSheet extends StatelessWidget {
  const AutoTopUpInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: Theme.of(context).extension<ColorExtension>()!.cardBorder,
              width: 2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    context.pop();
                },
                  child: Icon(Icons.close, color: Theme.of(context).extension<ColorExtension>()!.text, size: 24,),
                ),
                const DefaultText.bodySmall('Auto top-up'),
                const SizedBox(width: 24,),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(image: AssetImage(AppImages.posterHero), fit: BoxFit.cover)
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const DefaultText.headlineMedium('Stay connected without interruptions', textAlign: TextAlign.center,),
            const SizedBox(height: 14,),
            const DefaultText.bodySmall('Your data renews automatically when you run out so you don\'t have to top up manually'),
            const SizedBox(height: 14,),
            PrimaryButton(onTap: (){
              HapticFeedback.lightImpact();
              context.pop();
              context.push(Routes.autoTopUp);
            }, text: 'Got it', isExpanded: true,),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
