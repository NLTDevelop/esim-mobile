import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpInfoBottomSheet extends StatelessWidget {
  const AutoTopUpInfoBottomSheet({super.key, required this.eSimId, required this.currencyCode});
  final int eSimId;
  final String? currencyCode;


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
              height: MediaQuery.of(context).size.height * 0.24,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(AppImages.posterHero, fit: BoxFit.cover,)),
                  Positioned(top: 16 ,right: 0, left: 0, child: Image.asset(AppImages.splash, height: 60,)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const DefaultText.bodySmall('Stay connected without interruptions', fontWeight: FontWeight.w600, textAlign: TextAlign.center, letterSpacing: 1.05,),
            const SizedBox(height: 14,),
            const DefaultText.headlineSmall('Your data renews automatically when you run out so you don\'t have to top up manually', fontWeight: FontWeight.w500,),
            const SizedBox(height: 14,),
            PrimaryButton(onTap: (){
              HapticFeedback.lightImpact();
              context.pop();
              context.push(Routes.autoTopUp, extra: {
                'esim_id': eSimId,
                'currency_code': currencyCode,
              });
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
