import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/targets/get_target.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_esim_widget.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/no_plans_widget.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/row_dot_text.dart';
import 'package:esim_mob_app/features/notifcations/presentation/wigets/notification_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (!state.isFirstESim) {
          _showTutorialTargets(context);
        }
      },
      listenWhen: (previous, next) {
        return previous.isFirstESim != next.isFirstESim && !next.isFirstESim;
      },
      builder: (context, state) {
        return state.map(
            loading: (_) => const LoadingState(),
            failure: (_) => FailureState(onTap: () {}),
            success: (state) => state.tariffs.isEmpty ? const NoPlansWidget() : const HomeESimWidget(),
            initial: (state) => state.tariffs.isEmpty ? const NoPlansWidget() : const HomeESimWidget(),);
      },
    );
  }

  void _showTutorialTargets(BuildContext context){
    final bloc = context.read<HomeBloc>();
    bloc.tutorialCoachMark = TutorialCoachMark(
      targets: [
        TargetFocus(
            keyTarget: bloc.installESimButtonKey,
            paddingFocus: 4,
            enableTargetTab: false,
            enableOverlayTab: false,
            shape: ShapeLightFocus.RRect,
            radius: 16.0,
            contents: [
              getTargetContent(
                context,
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RowDotText(
                        text: 'To use the eSIM, you need to install it.',
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RowDotText(
                        text: 'Installation won\'t start your data plan',
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RowDotText(
                        text: 'The process takes several minutes',
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      RowDotText(
                        text:
                        'Choose "primary" if you asked about line setup',
                      ),
                    ],
                  ),
                ),
                    () {
                  bloc.tutorialCoachMark.next();
                },
                    () {
                  bloc.tutorialCoachMark.skip();
                },
                false,
                ContentAlign.bottom,
                Alignment.bottomRight,
              ),
            ]),
        TargetFocus(
            keyTarget: bloc.myESimsButtonKey,
            shape: ShapeLightFocus.RRect,
            radius: 16.0,
            paddingFocus: 8,
            enableTargetTab: false,
            enableOverlayTab: false,
            contents: [
              getTargetContent(
                context,
                const Padding(
                  padding:  EdgeInsets.only(bottom: 10.0),
                  child:  DefaultText.displaySmall(
                      'You can find all the data plans here.'),
                ),
                    () {
                  bloc.tutorialCoachMark.next();
                },
                    () {
                  bloc.tutorialCoachMark.skip();
                },
                true,
                ContentAlign.bottom,
                Alignment.topLeft,
              ),
            ]),
        TargetFocus(
            keyTarget: bloc.autoTopUpButtonKey,
            shape: ShapeLightFocus.RRect,
            radius: 16.0,
            paddingFocus: 4,
            enableTargetTab: false,
            enableOverlayTab: false,
            contents: [
              getTargetContent(
                context,
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: DefaultText.displayMedium(
                      'This is button for auto-top up eSim plan'),
                ),
                    () {
                  bloc.tutorialCoachMark.next();
                },
                    () {
                  bloc.tutorialCoachMark.skip();
                },
                false,
                ContentAlign.bottom,
                Alignment.bottomRight,
              ),
            ]),
      ],
      // List<TargetFocus>
      colorShadow: Colors.black.withAlpha(120),
      opacityShadow: 0.4,
      pulseEnable: false,
      hideSkip: true,
    )..show(context: context);
  }

  void _showNotificationBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, useSafeArea: true, useRootNavigator: true, isScrollControlled: true, builder: (ctx) => const NotificationBottomSheet());
  }
}
