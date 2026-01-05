
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class AddBalanceFirstContainer extends StatelessWidget {
  const AddBalanceFirstContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).extension<ColorExtension>()!.background,
        border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.hintText, )
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 3,
                height: 3,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).extension<ColorExtension>()!.text
                ),
              ),
              const SizedBox(width: 6,),
              Flexible(child: DefaultText.displaySmall('To continue, please top up your account balance.', maxLines: 2, fontWeight: FontWeight.w600,)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 3,
                height: 3,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).extension<ColorExtension>()!.text
                ),
              ),
              const SizedBox(width: 6,),
              Flexible(child: DefaultText.displaySmall('Minimum top-up: 5.00', maxLines: 2, fontWeight: FontWeight.w600)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 3,
                height: 3,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).extension<ColorExtension>()!.text
                ),
              ),
              const SizedBox(width: 6,),
              Flexible(child: DefaultText.displaySmall('Your balance will be available for all future purchases.', maxLines: 2, fontWeight: FontWeight.w600)),
            ],
          )
        ],
      ),
    );
  }
}
