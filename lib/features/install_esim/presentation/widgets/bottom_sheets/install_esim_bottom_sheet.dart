
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/install_esim_add_view.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/install_esim_chose_esim.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class InstallESimBottomSheet extends StatelessWidget {
  const InstallESimBottomSheet({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).extension<ColorExtension>()!.background
      ),
      child: SafeArea(
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
            BlocBuilder<InstallESimCubit, InstallESimState>(
              builder: (context, state) {
                return state.map(listESimsView: (_) => const InstallESimChoseESim(), installESimViw: (_) => InstallESimAddView(title: title));
              },
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
