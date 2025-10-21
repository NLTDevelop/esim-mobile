import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/state/payment_failed_state.dart';
import 'package:esim_mob_app/common/widgets/state/payment_succesfult_state.dart';
import 'package:esim_mob_app/features/payment/presentation/bloc/payment_bloc.dart';
import 'package:esim_mob_app/features/payment/presentation/widgets/payment_body.dart';
import 'package:esim_mob_app/features/payment/presentation/widgets/payment_loading_text.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.tariffModel});

  final TariffModel tariffModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PaymentBloc(price: tariffModel.price, currency: 'USD'),
      child: DefaultScaffold(
        body: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => const PaymentBody(),
                loading: (_) => const LoadingState(textWidget: PaymentLoadingText(),),
                success: (_) =>
                    PaymentSuccessfulState(tariffModel: tariffModel),
                failure: (_) => const PaymentFailedState());
          },
        ),
      ),
    );
  }
}
