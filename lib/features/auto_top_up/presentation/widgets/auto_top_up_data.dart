
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariff_card.dart';
import 'package:flutter/material.dart';

class AutoTopUpData extends StatelessWidget {
  const AutoTopUpData({super.key, required this.tariffs, required this.onTap, required this.selectedIndex});

  final List<TariffModel> tariffs;
  final void Function(int) onTap;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Theme.of(context).extension<ColorExtension>()!.cardBorder
            ),
          ),
          const SizedBox(height: 12,),
          ...tariffs.asMap().entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 10), child: PreviewTariffCard(price: e.value.price, dataInGb: e.value.dataInGB, days: e.value.durationInDays, isActive: e.key == selectedIndex, onTap: () {
            onTap(e.key);
          }))),
          const SizedBox(height: 22,),
        ],
      ),
    );
  }
}
