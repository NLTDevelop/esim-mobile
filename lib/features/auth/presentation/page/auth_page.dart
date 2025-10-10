import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/login/login_widget.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_apple_use_case.dart';
import 'package:esim_mob_app/features/auth/domain/use_cases/login_google_use_case.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthentificationBloc(loginGoogleUseCase: injector<LoginGoogleUseCase>(), loginAppleUseCase: injector<LoginAppleUseCase>()),
      child: DefaultScaffold(
        backgroundColor: Theme.of(context).extension<ColorExtension>()!
            .splashBackground,
        body: SafeArea(
            child:
        LoginWidget()
        ),
      ),
    );
  }
}
