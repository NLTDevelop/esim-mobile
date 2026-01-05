
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBody extends StatelessWidget {
  const PaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Spacer(),
            DefaultText.bodySmall('Payment for ${context.read<PaymentBloc>().state.price}'),
            const Spacer(),
            PrimaryButton(onTap: context.read<PaymentBloc>().onPay, text: 'Pay', isExpanded: true,),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
