import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/button/primary_switcher_button.dart';
import 'package:esim_mob_app/features/store/presentation/bloc/store_bloc.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/search_widget.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/store_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StoreContent extends StatelessWidget {
  const StoreContent({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SearchWidget(onChange: context.read<StoreBloc>().onChangeSearchText,)),
          Expanded(
            child: BlocBuilder<StoreBloc, StoreState>(
              builder: (context, state) {
                final bloc = context
                    .read<StoreBloc>();
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      PrimarySwitcherButton(
                        text: 'Local eSIM',
                        onTap: () {
                          bloc
                              .add(const StoreEvent.changePlansType(isLocal: true));
                        },
                        isActive: state.isLocal,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      PrimarySwitcherButton(
                        text: 'Regional eSIM',
                        onTap: () {
                          bloc
                              .add(const StoreEvent.changePlansType(isLocal: false));
                        },
                        isActive: !state.isLocal,
                      )
                    ]),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return StoreDataCard(
                            name: state.isLocal ? state.countryModels[index].name : state.regionModels[index].name,
                            isLocal: state.isLocal,
                            code: state.isLocal ? state.countryModels[index].code : null,
                            onTap: () {
                              HapticFeedback.lightImpact();
                              // context.push(Routes.tariffs, extra: { 'plan': plans[index], 'country': plans[index].title, 'icon_path': plans[index].image, 'is_local': plans[index].coverages.length == 1, 'is_from_welcome': bloc.isFromWelcome});
                              context.push(Routes.eSimList, extra: { 'currency_type': state.currencyType.name.toUpperCase(), 'country_entity': state.isLocal ? state.countryModels[index] : state.regionModels[index], 'is_from_welcome': bloc.isFromWelcome});
                            },
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: state.isLocal ? state.countryModels.length : state.regionModels.length,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
