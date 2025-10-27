import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/widgets/button/primary_switcher_button.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
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
                List<PlanModel> plans = state.text.isNotEmpty
                    ? state.planModels
                        .where((e) =>
                            e.title.contains(state.text) &&
                            e.isLocal == state.isLocal)
                        .toList()
                    : state.planModels
                        .where((e) => e.isLocal == state.isLocal)
                        .toList();
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
                              .add(const StoreEvent.changePlansType(true));
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
                              .add(const StoreEvent.changePlansType(false));
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
                            title: plans[index].title,
                            price: plans[index].price,
                            isLocal: plans[index].isLocal,
                            onTap: () {
                              HapticFeedback.lightImpact();
                              context.push(Routes.tariffs, extra: { 'tariffs': plans[index].tariffs, 'country': plans[index].title, 'icon_path': plans[index].iconPath ?? AppIcons.world, 'is_from_welcome': bloc.isFromWelcome});
                            },
                            iconPath: plans[index].iconPath,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: plans.length,
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
