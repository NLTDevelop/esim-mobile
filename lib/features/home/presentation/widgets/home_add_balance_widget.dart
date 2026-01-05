
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/add_balance_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAddBalanceWidget extends StatelessWidget {
  const HomeAddBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14,),
        DefaultText.labelLarge('AWINST CONNECT Balance',
            color: Theme.of(context).extension<ColorExtension>()!
                .text, fontWeight: FontWeight.w700, ),
        const SizedBox(height: 14,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14,),
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: Theme.of(context).extension<ColorExtension>()!.primary, width: 4)),
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).extension<ColorExtension>()!.background
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: const DefaultText.bodyMedium(
                  '5.00 \$', fontWeight: FontWeight.w600,),
              ),
              const SizedBox(
                height: 13,
              ),
              const Divider(),
              const SizedBox(
                height: 13,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: AddBalanceButton(onTap: (){
                  context.push(Routes.addBalance);
                }),
              ),],
          ),
        ),
      ],
    );
  }
}
