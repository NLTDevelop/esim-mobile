
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/bloc/preview_tariffs_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/activation_info_card.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreviewTariffsContent extends StatelessWidget {
  const PreviewTariffsContent({super.key, required this.country, required this.iconPath});

  final String country;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 17),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Theme.of(context).extension<ColorExtension>()!.cardBorder,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(iconPath, height: 25,),
                    const SizedBox(width: 12,),
                    DefaultText.displaySmall(country),
                  ],
                ),
              ),
            ),
            Flexible(
              child: BlocBuilder<PreviewTariffsBloc, PreviewTariffsState>(builder: (context, state) {
                final bloc = context.read<PreviewTariffsBloc>();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...state.tariffs.asMap().entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 10), child: PreviewTariffCard(price: e.value.price, dataInGb: e.value.dataInGB, days: e.value.durationInDays, isActive: e.key == state.selectedIndex, onTap: (){
                      bloc.add(PreviewTariffsEvent.selectIndex(e.key));
                    })))
                  ],
                );
              }),
            ),
            const SizedBox(height: 16,),
            const ActivationInfoCard(title: 'Can I activate my plan later', description: 'All plans have a 30-day activation period. If you get a plan today and don\'t activate it until November 6, it will be activated automatically.'),
          ],
        ),
      ),
    );
  }
}
