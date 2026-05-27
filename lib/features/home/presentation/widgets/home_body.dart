import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/targets/get_target.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/history/presentation/bloc/history_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/home_esim_widget.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/no_plans_widget.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/row_dot_text.dart';
import 'package:esim_mob_app/features/status_transaction/presentation/bloc/status_transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HistoryBloc>().add(const HistoryEvent.fetchHistory(page: 1));
    return BlocListener<StatusTransactionBloc, StatusTransactionState>(
  listener: (context, state) {
    context.read<AuthentificationBloc>().add(const AuthentificationEvent.getSignedInUser());
    context.read<HistoryBloc>().add(const HistoryEvent.fetchHistory(page: 1));
  },
      listenWhen: (prev, current){
        bool isPreviousPending = prev.maybeWhen(pending: (s, i) => true ,orElse: () => false);
        bool isCurrentNotPending = current.maybeMap(orElse: () => false, success: (s) => true, failure: (s) => true,failedPayment: (s) => true);
        return isPreviousPending && isCurrentNotPending;
      },
  child: BlocListener<HomeBloc, HomeState>(listener: (context, state) {
      if (!state.isFirstESim) {
        _showTutorialTargets(context);
      }
    }, listenWhen: (previous, next) {
      return previous.isFirstESim != next.isFirstESim && !next.isFirstESim;
    }, child: BlocConsumer<AuthentificationBloc, AuthentificationState>(
    listener: (context, state){
      state.maybeMap(notAuthenticated: (s) => context.go(Routes.auth), orElse: (){});
    },
        builder: (context, state) {
          // print(state.user);
      return state.mapOrNull(
              loading: (_) => const LoadingState(),
              failure: (s) => s.eSimActivations.isNotEmpty
                  ? const HomeESimWidget()
                  : const NoPlansWidget(),
              success: (s) => s.eSimActivations.isNotEmpty
                  ? const HomeESimWidget()
                  : const NoPlansWidget(),
          authenticated: (s) => s.eSimActivations.isNotEmpty
              ? const HomeESimWidget()
              : const NoPlansWidget(),
      ) ??
          const NoPlansWidget();
    })),
);
  }

  void _showTutorialTargets(BuildContext context) {
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
                        text: 'Choose "primary" if you asked about line setup',
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
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: DefaultText.displaySmall(
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

  // void _showNotificationBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       useSafeArea: true,
  //       useRootNavigator: true,
  //       isScrollControlled: true,
  //       builder: (ctx) => const NotificationBottomSheet());
  // }
}
