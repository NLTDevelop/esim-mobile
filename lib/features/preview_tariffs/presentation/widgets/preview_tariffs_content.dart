
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/bloc/preview_tariffs_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/activation_info_card.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PreviewTariffsContent extends StatelessWidget {
  const PreviewTariffsContent({super.key, required this.country, required this.iconPath});

  final String country;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
          Expanded(
            child: BlocBuilder<PreviewTariffsBloc, PreviewTariffsState>(builder: (context, state) {
              final bloc = context.read<PreviewTariffsBloc>();
              return ListView.separated(itemBuilder: (context, index) {
                return index != state.tariffs.length ? PreviewTariffCard(price: state.tariffs[index].price, dataInGb: state.tariffs[index].dataInGB, days: state.tariffs[index].durationInDays, isActive: index == state.selectedIndex, onTap: (){
                  bloc.add(PreviewTariffsEvent.selectIndex(index));
                }) :   ActivationInfoCard(title: 'Can I activate my plan later', description: 'All plans have a 30-day activation period. If you get a plan today and don\'t activate it until ${DateFormat('MMMM d').format(DateTime.now().add(const Duration(days: 30)))}, it will be activated automatically.');
              }, separatorBuilder: (context, index) {
                return index != state.tariffs.length ? const SizedBox(height: 10,) : const SizedBox.shrink();
              }, itemCount: state.tariffs.length + 1);
            }),
          ),
          const SizedBox(height: 16,),
          Padding(padding: const EdgeInsets.only(bottom: 12),child: SafeArea(child: PrimaryButton(onTap: (){
            final bloc =  context.read<PreviewTariffsBloc>();
            context.push(Routes.checkout, extra: {'tariff': bloc.state.tariffs[bloc.state.selectedIndex]});
          }, text: 'Continue', isExpanded: true,)))
        ],
      ),
    );
  }
}
