import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_esim_widget.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/no_plans_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
    return state.map(loading: (_) => const LoadingState(), failure: (_) => FailureState(onTap: (){}), success: (_) => NoPlansWidget(), initial: (_) => const HomeESimWidget());
          },
        );
  }
}
