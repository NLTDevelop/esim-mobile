
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/bloc/preview_tariffs_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariffs_body.dart';
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_local_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regional_esims_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PreviewTariffsPage extends StatelessWidget {
  const PreviewTariffsPage({super.key, required this.countryEntity, this.isFromWelcome = false});

  final BaseCountry countryEntity;
  final bool isFromWelcome;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = PreviewTariffsBloc(countryEntity: countryEntity, currency: context.read<AuthentificationBloc>().state.user.currencyCode ?? 'USD', isFromWelcome: isFromWelcome,
            fetchRegionalESimsUseCase: injector<FetchRegionalESimsUseCase>(), fetchLocalESimsUseCase: injector<FetchLocalESimsUseCase>());
        bloc.add(const PreviewTariffsEvent.fetchTariffs());
        return bloc;
      },
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios_sharp, size: 24,),
          ),
          centerTitle: true,
          title: DefaultText.bodySmall(countryEntity.name,),
        ),
        body: PreviewTariffsBody(),
      ),
    );
  }
}
