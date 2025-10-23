import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PaymentSuccessfulState extends StatelessWidget {
  const PaymentSuccessfulState({super.key, required this.tariffModel});

  final TariffModel tariffModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).extension<ColorExtension>()!.toggleCircle,
                    shape: BoxShape.circle),
                child: Icon(Icons.check,
                    color: Theme.of(context)
                        .extension<ColorExtension>()!
                        .toggleActive, size: 40,),
              ),
              const SizedBox(
                width: 30,
              ),
              const DefaultText.bodySmall(
                'Оплата пройшла успішно!',
              ),
              const SizedBox(
                height: 14,
              ),
              DefaultText.bodySmall(tariffModel.eSim.name),
              const SizedBox(
                height: 6,
              ),
              DefaultText.displayMedium(
                  'Start date: ${DateFormat.yMd().format(tariffModel.eSim.createdAt)}', textAlign: TextAlign.center,),
              const SizedBox(height: 6,),
              DefaultText.displayMedium('End date: ${DateFormat.yMd().format(tariffModel.eSim.createdAt.add(Duration(days: tariffModel.eSim.days)))}', textAlign: TextAlign.center,),
              const SizedBox(
                height: 60,
              ),
              PrimaryButton(onTap: () {
                context.go(Routes.home, extra: {'user_tariffs': []});
              }, text: 'Go to plans'),
            ],
          ),
        ),
      ),
    );
  }
}
