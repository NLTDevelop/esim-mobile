
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/bloc/auto_top_up_bloc.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/widgets/auto_top_up_confirm_dialog.dart';
import 'package:esim_mob_app/features/preview_tariffs/presentation/widgets/preview_tariff_card.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AutoTopUpData extends StatelessWidget {
  const AutoTopUpData({super.key, required this.tariffs, required this.onTap, required this.selectedIndex});

  final List<UserPackageModel> tariffs;
  final void Function(int) onTap;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<AuthentificationBloc, AuthentificationState>(
  builder: (context, state) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).extension<ColorExtension>()!.cardBorder
                ),
              ),
              const SizedBox(height: 12,),
              ...tariffs.asMap().entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 10), child: PreviewTariffCard( currencyCode: state.user.currencyCode,price: e.value.price, dataInGb: e.value.dataInMB / 1024, days: e.value.validDays ?? 0, isActive: e.key == selectedIndex, onTap: () {
                onTap(e.key);
              }))),
              const SizedBox(height: 22,),
            ],
          );
  },
),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10 + MediaQuery.of(context).padding.bottom),
            child: PrimaryButton(onTap: () async {
              final result = await showDialog(
                  context: context,
                  builder: (ctx) => AutoTopUpConfirmDialog(onConfirm: () {
                    context.pop(true);
                    // context.pop();
                    context.read<AutoTopUpBloc>().add(const AutoTopUpEvent.enableAutoTop());
                  })
              );
              if(result){
                context.pop();
              }
            }, text: 'Confirm'),
          ),
        ),
      ],
    );
  }
}
