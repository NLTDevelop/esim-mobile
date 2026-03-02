import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:flutter/material.dart';

class TopUpPackageContainer extends StatelessWidget {
  const TopUpPackageContainer(
      {super.key,
      required this.onTap,
      required this.title,
      required this.dataInMb,
      required this.validDays,
      required this.price,
      required this.isSelected});

  final Function() onTap;
  final String title;
  final String dataInMb;
  final int validDays;
  final String price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
            color: Theme.of(context).extension<ColorExtension>()!.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 32, 70, .15),
                  offset: Offset(0, 3),
                  blurRadius: 5)
            ]),
        child: Row(
          children: [
            Column(
              children: [
                DefaultText.bodySmall(title),
                const SizedBox(
                  height: 6,
                ),
                DefaultText.displaySmall('$dataInMb mb')
              ],
            ),
            const SizedBox(
              width: 14,
            ),
            DefaultText.displaySmall('Price: $price'),
            const Spacer(),
            Container(
              height: 30,
              width: 30,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context)
                        .extension<ColorExtension>()!
                        .toggleCircle,
                    width: 2),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context)
                            .extension<ColorExtension>()!
                            .toggleActive
                        : Colors.transparent,
                    shape: BoxShape.circle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
