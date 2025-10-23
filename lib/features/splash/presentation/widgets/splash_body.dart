import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/connection_checker/bloc/connection_checker_cubit.dart';
import 'package:esim_mob_app/features/connection_checker/widgets/offline_widget.dart';
import 'package:esim_mob_app/features/localization/presentation/cubit/localization_cubit.dart';
import 'package:esim_mob_app/features/splash/presentation/widgets/splash_widget.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {

  bool _isUserSet = false;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        initializeDependencies(
          onAuth: (user) {
            if (_isConnected) {
              _setUser(context, user);
            } else {
              _isUserSet = true; // Mark user as set but not authenticated yet
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<ConnectionCheckerCubit, ConnectionCheckerState>(
    listener: (context, state) {
      state.maybeWhen(
        connected: () async{
          _isConnected = true;
          if (_isUserSet) {
            final user = await fetchCurrentUser();
            _setUser(context, user);
          }
        },
        orElse: () {
          _isConnected = false;
        },
      );
    },
    builder: (context, state) => state.maybeMap(
      connected: (_) => const SplashWidget(),
      offline: (_) => const OfflineWidget(),
      orElse: () => const SizedBox.shrink(),
    ),
  );

  Future<void> _setUser(BuildContext context, UserModel user) async {
    await context.read<LocalizationCubit>().changeLanguage('en');
    _isUserSet = true;
    context.read<AuthentificationBloc>().add(AuthentificationEvent.setUser(user: user));

    context.go(Routes.home, extra: {'user_tariffs': user.userTariffs});

  }
}
