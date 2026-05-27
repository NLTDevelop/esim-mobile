
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/install_esim_add_view.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/install_esim_chose_esim.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/install_esim_installation_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class InstallESimBottomSheet extends StatelessWidget {
  const InstallESimBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).extension<ColorExtension>()!.background
      ),
      child: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 70,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).extension<ColorExtension>()!
                        .cardBorder),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
              child: BlocConsumer<InstallESimCubit, InstallESimState>(
                listener: (ctx, state){
                  state.maybeMap(orElse: () => {}, installESimViw: (s) {
                    if(s.isESimCopied){
                      DefaultSnackBar.show(
                          context: ctx,
                          alignment: SnackAlignment.bottom,
                          title: 'Your eSIM was copied. Now install it manually.',
                          displayDuration: const Duration(milliseconds: 2000),
                          type: 'info'
                      );
                    }
                  });
                },
                builder: (context, state) {
                  final cubit = context.read<InstallESimCubit>();
                  return state.map(
                      listESimsView: (_) => _.isLoading ? SizedBox(height: MediaQuery.of(context).size.height / 2, child: const LoadingState()) : const InstallESimChoseESim(),
                      installESimViw: (s) => InstallESimAddView(title: 'eSIM #${cubit.userESims[cubit.chosenIndex].id}'),
                      installationSelectionView: (s) => const InstallEsimInstallationSelectionView()
                  );
                },
              ),
            ),
            const SizedBox(
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
