
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/auth/presentation/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: BlocConsumer<AuthentificationBloc, AuthentificationState>(
        listener: (context, state){
          print("Current state");
          print(state);
          state.mapOrNull(
            authenticated: (state) {
              print('hello');
              context.go(Routes.home);
            },
            failure: (_) {
              DefaultSnackBar.show(
                context: context,
                message: 'Error. Something goes wrong',
              );
            },
          );
        },
  builder: (context, state) {

    return state.map(
        authenticated: (state) => const LoginBody(),
        loading:  (state) => const LoadingState(),
        failure: (state) => FailureState(onTap: () {}),
        success: (state) => const LoginBody(),
        notAuthenticated: (state) =>  const LoginBody(),
      initial: (state) => const LoginBody()
    );
  },
),
    );
  }
}
