

import 'dart:io';

import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthentificationBloc>();
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        // Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 22),
        //     child: Container(
        //       width: 75,
        //       height: 75,
        //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), image: const DecorationImage(image: AssetImage(AppImages.logo), fit: BoxFit.cover)),
        //     )),
        DefaultText.bodySmall(
          'Login or sign up to access your eSIMs',
          color: Theme.of(context).extension<ColorExtension>()!.secondaryText,
          fontSize: 22,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
                onTap: bloc.onLoginGoogleTap,
                text: 'Continue with Google',
                icon: SvgPicture.asset(
                  AppIcons.google,
                  width: 24,
                  height: 24,
                )),
            const SizedBox(
              height: 20,
            ),
            if(Platform.isIOS)
              PrimaryButton(
                onTap: bloc.onLoginAppleTap,
                text: 'Continue with Apple',
                icon: SvgPicture.asset(
                  AppIcons.ios,
                  width: 24,
                  height: 24,
                )),
          ],
        ),
        const SizedBox(
          height: 45,
        ),
      ],
    );
  }
}
