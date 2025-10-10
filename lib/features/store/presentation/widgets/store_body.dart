import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/store/presentation/bloc/store_bloc.dart';
import 'package:esim_mob_app/features/store/presentation/widgets/store_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreBody extends StatelessWidget {
  const StoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreBloc, StoreState>(
      builder: (context, state) {
        return state.map(
            success: (_) => const StoreContent(),
            loading: (_) => const LoadingState(),
            failure: (_) => FailureState(onTap: () {
                  context.read<StoreBloc>().add(const StoreEvent.fetchPlans());
                }),
            initial: (_) => const LoadingState());
      },
    );
  }
}
