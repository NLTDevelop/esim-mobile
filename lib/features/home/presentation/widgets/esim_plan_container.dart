

import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ESimPlanContainer extends StatelessWidget {
  const ESimPlanContainer({super.key, required this.eSim});

  final ESimModel eSim;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).extension<ColorExtension>()!.background
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: SvgPicture.asset(eSim.iconPath),
              ),
              const SizedBox(width: 10,),
              DefaultText.displaySmall(eSim.name),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: eSim.isActive ? Theme.of(context).extension<ColorExtension>()!.primary : Theme.of(context).extension<ColorExtension>()!.cardBorder
                ),
                child: DefaultText.labelSmall(eSim.isActive ? 'Active' : 'Inactive', color: eSim.isActive ? Theme.of(context).extension<ColorExtension>()!.secondaryText : Theme.of(context).extension<ColorExtension>()!.text),
              )
            ],
          ),
          const SizedBox(height: 14,),
          Row(
            children: [
              const DefaultText.displaySmall('Data'),
              const Spacer(),
              DefaultText.displaySmall('${eSim.dataInGB} GB'),
            ],
          ),
          Divider(
            color: Theme.of(context).extension<ColorExtension>()!.divider,
            height: 16,
          ),
          Row(
            children: [
              const DefaultText.displaySmall('Duration'),
              const Spacer(),
              DefaultText.displaySmall('${eSim.days} days'),
            ],
          ),
          Divider(
            color: Theme.of(context).extension<ColorExtension>()!.divider,
            height: 16,
          ),
          Row(
            children: [
              const DefaultText.displaySmall('Valid until'),
              const Spacer(),
              DefaultText.displaySmall(DateFormat.yMd().format(eSim.createdAt.add(Duration(days: eSim.days)))),
            ],
          ),
        ],
      ),
    );
  }
}
