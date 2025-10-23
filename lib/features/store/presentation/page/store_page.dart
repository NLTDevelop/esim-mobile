
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:esim_mob_app/features/store/presentation/bloc/store_bloc.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/change_currency_popup_button.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/store_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StorePage extends StatelessWidget {
  const StorePage({super.key, this.isFromWelcome = false});

  final bool isFromWelcome;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = StoreBloc(isFromWelcome: isFromWelcome);
        bloc.add(const StoreEvent.fetchPlans());
        return bloc;
      },
      child: DefaultScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
          centerTitle: true,
        ),
        body: StoreBody(),
      ),
    );
  }
}
