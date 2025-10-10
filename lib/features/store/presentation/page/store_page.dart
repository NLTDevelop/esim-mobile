import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:esim_mob_app/features/store/presentation/bloc/store_bloc.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/change_currency_popup_button.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/store_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = StoreBloc();
        bloc.add(const StoreEvent.fetchPlans());
        return bloc;
      },
      child: DefaultScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_ios_sharp,
                color: Theme.of(context).extension<ColorExtension>()!
                    .actionButton, size: 20),
          ),
          actionsPadding: const EdgeInsets.only(right: 12),
          actions: [
            BlocBuilder<StoreBloc, StoreState>(
              builder: (context, state) {
                return ChangeCurrencyPopupButton(
                    onTap: (CurrencyType type){
                      context.read<StoreBloc>().add(StoreEvent.changeCurrencyType(type));
                    }, selectedType: state.currencyType);
              },
            )
          ],
          title: const DefaultText.bodySmall('Data store'),
        ),
        body: StoreBody(),
      ),
    );
  }
}
