import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/core/constants/launch_links.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:esim_mob_app/features/profile/presentation/widgets/profile_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 10),
                child: DefaultText.labelLarge(
                  'Profile',
                  color: Theme.of(context).extension<ColorExtension>()!.text,
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                      color: Theme.of(context)
                          .extension<ColorExtension>()!
                          .cardBorder,
                      width: 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 32, 70, .15),
                        offset: Offset(0, 3),
                        blurRadius: 5)
                  ]),
              child: Row(children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DefaultText.titleLarge('Your email address'),
                    const SizedBox(
                      width: 6,
                    ),
                    DefaultText.displaySmall(
                      context.read<AuthentificationBloc>().state.user.userEmail,
                      color: Theme.of(context)
                          .extension<ColorExtension>()!
                          .descriptionText,
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(
              height: 14,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileButton(
                      text: 'Marketing communication',
                      description:
                          'Enable this option to receive exclusive Awinst Connect offers and promotions.',
                      iconPath: AppIcons.notification,
                      leadingIcon: CupertinoSwitch(
                          value: state.isNotify,
                          activeTrackColor: Theme.of(context).primaryColor,
                          inactiveTrackColor: Theme.of(context).cardColor,
                          thumbColor: Theme.of(context).scaffoldBackgroundColor,
                          onChanged: (value) {
                            context.read<ProfileBloc>().add(
                                ProfileEvent.changeNotificationStatus(
                                    isNotify: value));
                          }),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ProfileButton(
                      text: 'Terms of condition',
                      iconPath: AppIcons.termsOfCondition,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.read<ProfileBloc>().openLink(Uri.parse(LaunchLinks.termsOfConditions));
                      },
                      leadingIcon: Icon(
                        Icons.arrow_forward_ios,
                        size: 22,
                        color: Theme.of(context)
                            .extension<ColorExtension>()!
                            .descriptionText,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ProfileButton(
                        text: 'Privacy policy',
                        iconPath: AppIcons.privacyPolicy,
                        onTap: () {
                          HapticFeedback.lightImpact();
                          context.read<ProfileBloc>().openLink(Uri.parse(LaunchLinks.privacyPolicy));
                        },
                        leadingIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 22,
                          color: Theme.of(context)
                              .extension<ColorExtension>()!
                              .descriptionText,
                        )),
                    const SizedBox(
                      height: 14,
                    ),
                    BlocListener<AuthentificationBloc, AuthentificationState>(
                      listener: (context, state) {
                        if (state.user.isNotAuthenticated) {
                          context.go(Routes.auth);
                        }
                      },
                      child: ProfileButton(
                          text: 'Logout',
                          iconPath: AppIcons.logout,
                          onTap: () {
                            HapticFeedback.lightImpact();
                            context
                                .read<AuthentificationBloc>()
                                .add(const AuthentificationEvent.logout());
                          }),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    ProfileButton(
                      text: 'Delete account',
                      iconPath: AppIcons.delete,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.read<AuthentificationBloc>().onDeleteAccount();
                      },
                      textColor:
                          Theme.of(context).extension<ColorExtension>()!.error,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
