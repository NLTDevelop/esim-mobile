
import 'package:esim_mob_app/common/widgets/circular_progress_indicator/default_circular_progress_indicator.dart';
import 'package:esim_mob_app/features/connection_checker/bloc/connection_checker_cubit.dart';
import 'package:esim_mob_app/features/connection_checker/widgets/connection_listener.dart';
import 'package:esim_mob_app/features/connection_checker/widgets/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkCheckerWidget extends StatelessWidget {
  const NetworkCheckerWidget({
    super.key,
    required this.connectedChild,
  });

  final Widget connectedChild;

  @override
  Widget build(BuildContext context) {
    return ConnectionListener(
      child: BlocBuilder<ConnectionCheckerCubit, ConnectionCheckerState>(
        builder: (BuildContext context, ConnectionCheckerState state) {
          return state.maybeMap(
            connected: (_) => connectedChild,
            offline: (_) => const OfflineWidget(),
            orElse: () => const DefaultCircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
