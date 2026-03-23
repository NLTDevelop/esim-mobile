
import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/core/constants/variables.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InstallESimAddView extends StatelessWidget {
  const InstallESimAddView({super.key, required this.title,});

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
          context.push(Routes.installationInstruction, extra: {'activation_code': kTest2ESimPackage});
        }, text: 'Install eSIM manually', isExpanded: true,),
        const SizedBox(height: 10,),
        DefaultText.displayMedium('If can install eSIM with "Install eSIM" button try install it manually.'),
        const SizedBox(
          height: 14,
        ),
        PrimaryButton(onTap: (){
          context.read<InstallESimCubit>().shareESim();
        }, text: 'Send eSIM to another device', isActive: false, isExpanded: true,)
      ],
    );
  }
}
