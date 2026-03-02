
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/circular_progress_indicator/default_circular_progress_indicator.dart';
import 'package:esim_mob_app/features/connection_checker/bloc/connection_checker_cubit.dart';
import 'package:esim_mob_app/features/connection_checker/widgets/connection_listener.dart';
import 'package:esim_mob_app/features/connection_checker/widgets/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          print(GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString());
          return state.maybeMap(
            connected: (_) => connectedChild,
            offline: (_) => OfflineWidget(textColor: Theme.of(context).extension<ColorExtension>()!.text,),
            orElse: () => const DefaultCircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
