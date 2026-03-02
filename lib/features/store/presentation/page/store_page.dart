
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_countries_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regions_use_case.dart';
import 'package:esim_mob_app/features/store/presentation/bloc/store_bloc.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/change_currency_popup_button.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/store_body.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StorePage extends StatelessWidget {
  const StorePage({super.key, this.isFromWelcome = false});

  final bool isFromWelcome;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = StoreBloc( injector<FetchRegionsUseCase>(), injector<FetchCountriesUseCase>(), isFromWelcome: isFromWelcome);
        bloc.add(const StoreEvent.fetchPlans());
        return bloc;
      },
      child: DefaultScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actionsPadding: const EdgeInsets.only(right: 12),
          actions: [
            BlocBuilder<AuthentificationBloc, AuthentificationState>(
              builder: (context, state) {
                return ChangeCurrencyPopupButton(
                    onTap: (CurrencyType type){
                      context.read<AuthentificationBloc>().add(AuthentificationEvent.changeCurrencyCode(currencyCode: type.name.toUpperCase()));
                      // context.read<StoreBloc>().add(StoreEvent.changeCurrencyType(type));
                    }, selectedType: state.user.currencyCode != null
                    ? state.user.currencyCode == 'USD'
                    ? CurrencyType.usd
                    : CurrencyType.eur
                    : CurrencyType.usd,);
              },
            )
          ],
          title: const DefaultText.bodySmall('Data plans'),
          centerTitle: true,
        ),
        body: StoreBody(),
      ),
    );
  }
}
