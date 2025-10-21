import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/bloc/auto_top_up_bloc.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/widgets/auto_top_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpPage extends StatelessWidget {
  const AutoTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = AutoTopUpBloc();
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
        body: BlocBuilder<AutoTopUpBloc, AutoTopUpState>(
          builder: (context, state) {
            return state.map(
                success: (_) => const AutoTopUpBody(),
                loading: (_) => const LoadingState(),
                failure: (_) => FailureState(onTap: () {}),
                initial: (_) => const LoadingState());
          },
        ),
      ),
    );
  }
}
