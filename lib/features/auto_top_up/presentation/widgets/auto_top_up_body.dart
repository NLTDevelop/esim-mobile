import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/bloc/auto_top_up_bloc.dart';
import 'package:esim_mob_app/features/auto_top_up/presentation/widgets/auto_top_up_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoTopUpBody extends StatelessWidget {
  const AutoTopUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),
              DefaultText.labelLarge('Current balance',
                  color: Theme.of(context).extension<ColorExtension>()!
                      .descriptionText),
              const SizedBox(
                height: 14,
              ),
              const DefaultText.headlineLarge(
                '5.00 \$', fontWeight: FontWeight.w600,),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: PrimaryButton(
                    onTap: () {
                      showModalBottomSheet(context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          builder: (ctx) {
                            return BlocProvider.value(
                              value: BlocProvider.of<AutoTopUpBloc>(context),
                              child: AutoTopUpBottomSheet(),
                            );
                          });
                    }, text: 'Activate Auto Top-Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
