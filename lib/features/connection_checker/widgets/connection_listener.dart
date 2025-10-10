import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/features/connection_checker/bloc/connection_checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionListener extends StatelessWidget {
  const ConnectionListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionCheckerCubit, ConnectionCheckerState>(
      listener: (BuildContext context, ConnectionCheckerState state) {
        state.mapOrNull(
            connected: (_) {
              DefaultSnackBar.show(
                context: context,
                title: 'No internet connection',
                message: 'Try reconect',
              );
            }
        );
      },
      child: child,
    );
  }
}
