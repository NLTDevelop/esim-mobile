import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/button/primary_switcher_button.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/presentation/bloc/store_bloc.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/search_widget.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/store_data_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StoreContent extends StatelessWidget {
  const StoreContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: SearchWidget()),
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
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      PrimarySwitcherButton(
                        text: 'Local eSIM',
                        onTap: () {
                          context
                              .read<StoreBloc>()
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
                          context
                              .read<StoreBloc>()
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
                              context.push(Routes.tariffs, extra: { 'country': plans[index].title, 'icon_path': plans[index].iconPath});
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
