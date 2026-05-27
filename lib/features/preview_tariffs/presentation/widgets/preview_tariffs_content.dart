import 'dart:ui';

import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/bloc/preview_tariffs_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/activation_info_card.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariff_card.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PreviewTariffsContent extends StatelessWidget {
  const PreviewTariffsContent(
      {super.key,});


  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreviewTariffsBloc>();
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
                bloc.countryEntity is CountryModel ? SvgPicture.network(
                  'https://myaccount.keepgo.com/img/flags/3x2/${(bloc.countryEntity as CountryModel).code.toLowerCase()}.svg',
                  height: 25,
                ) : Container(
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
                const SizedBox(
                  width: 12,
                ),
                DefaultText.displaySmall(bloc.countryEntity.name),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<PreviewTariffsBloc, PreviewTariffsState>(
                builder: (context, state) {
              final bloc = context.read<PreviewTariffsBloc>();
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return index != state.tariffs.length
                        ? PreviewTariffCard(
                            price: state.tariffs[index].price,
                            dataInGb: (state.tariffs[index].dataInMb / 1024),
                            days: state.tariffs[index].validDays ?? 0,
                            isActive: index == state.selectedIndex,
                            currencyCode: context.read<AuthentificationBloc>().state.user.currencyCode,
                            onTap: () {
                              HapticFeedback.lightImpact();
                              bloc.add(PreviewTariffsEvent.selectIndex(index));
                            })
                        : ActivationInfoCard(
                            title: 'Can I activate my plan later',
                            description:
                                'All plans have a 30-day activation period. If you get a plan today and don\'t activate it until ${DateFormat('MMMM d').format(DateTime.now().add(const Duration(days: 30)))}, it will be activated automatically.');
                  },
                  separatorBuilder: (context, index) {
                    return index != state.tariffs.length
                        ? const SizedBox(
                            height: 10,
                          )
                        : const SizedBox.shrink();
                  },
                  itemCount: state.tariffs.length + 1);
            }),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SafeArea(
                  child: PrimaryButton(
                onTap: () {
                  HapticFeedback.lightImpact();
                  final bloc = context.read<PreviewTariffsBloc>();
                  if (bloc.isFromWelcome) {
                    context.go(Routes.auth);
                  } else {
                    context.push(Routes.checkout, extra: {
                      'tariff': bloc.tariffs[bloc.state.selectedIndex],
                      'image': bloc.countryEntity is CountryModel ? bloc.plan.image ?? 'https://myaccount.keepgo.com/img/flags/3x2/${(bloc.countryEntity as CountryModel).code.toLowerCase()}.svg' : null,
                      'country': bloc.countryEntity.name,
                      'type': bloc.countryEntity is CountryModel ? 'local' : 'regional',
                      'country_code': bloc.isLocal ? bloc.countryCodeFromCountryModel ?? 'US' : bloc.countryCodeFromPrivacyIPLocation ?? 'US'
                    });
                  }
                },
                text: context.read<PreviewTariffsBloc>().isFromWelcome
                    ? 'Sign in'
                    : 'Continue',
                isExpanded: true,
              )))
        ],
      ),
    );
  }
}
