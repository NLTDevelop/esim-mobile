import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/esim_list/presentation/bloc/esim_list_bloc.dart';
import 'package:esim_mob_app/features/esim_list/presentation/widgets/esim_list_body.dart';
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_local_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regional_esims_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ESimListPage extends StatelessWidget {
  const ESimListPage(
      {super.key, required this.baseCountry, required this.currencyType, required this.isFromWelcome});

  final BaseCountry baseCountry;
  final String currencyType;
  final bool isFromWelcome;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            HapticFeedback.lightImpact();
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_sharp, size: 24,),
        ),
        centerTitle: true,
        title: DefaultText.bodySmall('Choose eSIM',),
      ),
      body: BlocProvider(
        create: (context) => ESimListBloc(
            fetchLocalESimsUseCase: injector<FetchLocalESimsUseCase>(),
            fetchRegionalESimsUseCase: injector<FetchRegionalESimsUseCase>(),
            currencyCode: currencyType,
            isFromWelcome: isFromWelcome,
            baseCountryEntity: baseCountry)..add(ESimListEvent.fetchListESims()),
        child: ESimListBody(),
      ),
    );
  }
}
