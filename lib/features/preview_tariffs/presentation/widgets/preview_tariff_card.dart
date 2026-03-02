
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class PreviewTariffCard extends StatelessWidget {
  const PreviewTariffCard({super.key, required this.price, required this.dataInGb, required this.days, required this.isActive, required this.onTap,required this.currencyCode});

  final double price;
  final double dataInGb;
  final int days;
  final bool isActive;
  final void Function() onTap;
  final String? currencyCode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
                color:
                isActive ? Theme.of(context).extension<ColorExtension>()!.toggleActive : Theme.of(context).extension<ColorExtension>()!.cardBorder,
                width: isActive ? 2 : 1),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 32, 70, .15),
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).extension<ColorExtension>()!.toggleCircle, width: 2),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: isActive ? Theme.of(context).extension<ColorExtension>()!.toggleActive : Colors.transparent,
                    shape: BoxShape.circle
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12,),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultText.labelMedium('${dataInGb.toStringAsFixed(2)} GB'),
                      const Spacer(),
                      DefaultText.labelMedium('${currencyCode != null ? currencyCode == 'EUR' ? 'EU€' : 'US\$' : 'US\$'}$price'),
                    ],
                  ),
                  DefaultText.displaySmall(days <= 0 ? 'No limits' : '$days days'),
                ],
              ),
            )
          ],
        ),
        ),
    )
    ;
  }
}
