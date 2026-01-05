
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/esim_list/presentation/bloc/esim_list_bloc.dart';
import 'package:esim_mob_app/features/esim_list/presentation/widgets/esim_data_card.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ESimListContent extends StatelessWidget {
  const ESimListContent({super.key, required this.country, required this.eSims,});

  final String country;
  final List<PlanModel> eSims;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ESimListBloc>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                  bloc.baseCountryEntity is CountryModel ? Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.network(
                      'https://myaccount.keepgo.com/img/flags/3x2/${(bloc.baseCountryEntity as CountryModel).code.toLowerCase()}.svg',
                      height: 24,
                    ) ,
                  )
                      : Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        height: 32,
                        width: 56,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context)
                                .extension<ColorExtension>()!
                                .toggleCircle),
                        child: SvgPicture.asset(
                          AppIcons.world,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context)
                                  .extension<ColorExtension>()!
                                  .secondaryText,
                              BlendMode.srcIn),
                        )),
                  ),
                  DefaultText.bodySmall(country, fontSize: 17, fontWeight: FontWeight.w600,),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ESimDataCard(
                        eSim: eSims[index],
                        onTap: () {
                          HapticFeedback.lightImpact();
                          context.push(Routes.tariffs, extra: { 'plan': eSims[index], 'country_entity': bloc.baseCountryEntity, 'is_from_welcome': bloc.isFromWelcome});
                        });
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: eSims.length
              ),
            ),
          ],
        ),
      ),
    );
  }
}
