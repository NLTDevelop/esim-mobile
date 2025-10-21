import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/bloc/auto_top_up_bloc.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/widgets/auto_top_up_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoTopUpBottomSheet extends StatelessWidget {
  const AutoTopUpBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: Theme.of(context).extension<ColorExtension>()!.cardBorder,
                  width: 2),
              color: Theme.of(context).extension<ColorExtension>()!.background),
          child: BlocBuilder<AutoTopUpBloc, AutoTopUpState>(
            builder: (context, state) {
              return state.map(
                  success: (_) => AutoTopUpData(
                        tariffs: state.tariffs,
                        onTap: context.read<AutoTopUpBloc>().selectTariff,
                        selectedIndex: state.selectedIndex,
                      ),
                  loading: (_) => const LoadingState(),
                  failure: (_) => FailureState(onTap: () {}),
                  initial: (_) => const LoadingState());
            },
          ),
        );
      }
    );
  }
}
