
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallESimAddView extends StatelessWidget {
  const InstallESimAddView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultText.bodySmall(title),
        const SizedBox(
          height: 30,
        ),
        PrimaryButton(onTap: (){
          context.read<InstallESimCubit>().installESim();
        }, text: 'Install eSIM', isExpanded: true,),
        const SizedBox(
          height: 14,
        ),
        PrimaryButton(onTap: (){
          context.read<InstallESimCubit>().shareESim();
        }, text: 'Share eSIM to other person', isActive: false, isExpanded: true,)
      ],
    );
  }
}
