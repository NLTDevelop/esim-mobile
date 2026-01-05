
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/esim_list/presentation/bloc/esim_list_bloc.dart';
import 'package:esim_mob_app/features/esim_list/presentation/widgets/esim_list_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ESimListBody extends StatelessWidget {
  const ESimListBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ESimListBloc, ESimListState>(builder: (context, state){
      return state.map(
          success: (_) => ESimListContent(country: context.read<ESimListBloc>().baseCountryEntity.name, eSims: state.eSims,),
          loading: (_) => const LoadingState(),
          failure: (_) => FailureState(onTap: () {
            // context.read<PreviewTariffsBloc>().add(const PreviewTariffsEvent.fetchTariffs());
          }),
          initial: (_) => const LoadingState());
    });
  }
}
