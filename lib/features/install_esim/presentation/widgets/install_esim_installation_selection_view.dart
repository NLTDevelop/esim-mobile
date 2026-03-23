import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallEsimInstallationSelectionView extends StatelessWidget {
  const InstallEsimInstallationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButton(onTap: () {
          context.read<InstallESimCubit>().installESim();
        }, text: 'Install eSIM', isExpanded: true,),
        const SizedBox(
          height: 14,
        ),
        PrimaryButton(onTap: () {
          context.read<InstallESimCubit>().shareESim();
        }, text: 'Install eSIM manually', isExpanded: true,),
        BlocBuilder<InstallESimCubit, InstallESimState>(
          builder: (context, state) {
            return state.maybeMap(
                orElse: () => Container(),
                installationSelectionView: (s) => AnimatedCrossFade(
                    firstChild: Container(),
                    secondChild: DefaultText.displaySmall('eSIM installation may not work on some Android devices, so you may need to install the eSIM manually.'),
                    crossFadeState: s.isInfoOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300)
                )
            );
          },
        ),
      ],
    );
  }
}