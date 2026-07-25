
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/bloc/preview_tariffs_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariffs_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreviewTariffsBody extends StatelessWidget {
  const PreviewTariffsBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviewTariffsBloc, PreviewTariffsState>(builder: (context, state){
      return state.map(
          success: (_) => const PreviewTariffsContent(),
          loading: (_) => const LoadingState(),
          failure: (_) => FailureState(onTap: () {
            context.read<PreviewTariffsBloc>().add(const PreviewTariffsEvent.fetchTariffs());
          }),
          initial: (_) => const LoadingState());
    });
  }
}
