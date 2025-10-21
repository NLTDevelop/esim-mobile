
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentFailedState extends StatelessWidget {
  const PaymentFailedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.close, color: Theme.of(context).extension<ColorExtension>()!.error, size: 80,),
            const SizedBox(height: 12,),
            DefaultText.bodySmall('Оплата не пройшла', color: Theme.of(context).extension<ColorExtension>()!.error,),
            const SizedBox(
              height: 60,
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(onTap: (){
                      context.read<PaymentBloc>().onPay();
                    }, text: 'Повторити ще раз',),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                    child: PrimaryButton(onTap: (){
                      context.pop();
                    }, text: 'Повернутися назад'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
