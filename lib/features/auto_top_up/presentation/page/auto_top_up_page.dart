import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/auto_top_up_successfull_state.dart';
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/use_cases/fetch_activation_top_up_list_use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/use_cases/update_auto_top_up_use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/bloc/auto_top_up_bloc.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/widgets/auto_top_up_body.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpPage extends StatelessWidget {
  const AutoTopUpPage({super.key, required this.eSimId, required this.currencyCode});

  final int eSimId;
  final String? currencyCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AutoTopUpBloc(eSimId: eSimId, fetchActivationTopUpListUseCase: injector<FetchActivationTopupListUseCase>(), updateActivationTopUpUseCase: injector<UpdateActivationTopUpUseCase>(), currencyCode: currencyCode);
        bloc.add(const AutoTopUpEvent.fetchTariffs());
        return bloc;
      },
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: Theme.of(context).extension<ColorExtension>()!.text,
            ),
          ),
          title: const DefaultText.bodySmall('Auto Top-Up'),
        ),
        body: BlocConsumer<AutoTopUpBloc, AutoTopUpState>(
          builder: (context, state) {
            return state.map(
                success: (_) => const AutoTopUpBody(),
                loading: (_) => const LoadingState(),
                failure: (_) => const AutoTopUpBody(),
                initial: (_) => const LoadingState(),
                successAutoTopUp: (_) => const AutoTopUpSuccessfulState(),
                failedAutoTop: (_) => FailureState(onTap: () {}),);
          }, listener: (BuildContext context, AutoTopUpState state) {
            state.mapOrNull(failure: (s) =>
                DefaultSnackBar.show(context: context, message: s.message)
            );
        },
        ),
      ),
    );
  }
}
