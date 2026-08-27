import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/state/success_state.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_cubit.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_state.dart';
import 'package:esim_mob_app/features/add_balance/presentation/widgets/add_balance_body.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/deposit/domain/use_cases/add_balance_use_case.dart';
import 'package:esim_mob_app/features/status_transaction/domain/use_cases/save_last_transaction_id_use_case.dart';
import 'package:esim_mob_app/features/status_transaction/presentation/bloc/status_transaction_bloc.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBalanceCubit(
        addBalanceUseCase: injector<AddBalanceUseCase>(),
        currency: context.read<AuthentificationBloc>().state.user.when(
          authenticated: (s) => s.currency ?? 'USD',
          notAuthenticated: () => '',
        ),
      ),
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).extension<ColorExtension>()!.text,
            ),
          ),
        ),
        body: BlocConsumer<AddBalanceCubit, AddBalanceState>(
          listenWhen: (previous, current) =>
              previous.paymentIntentClientSecret !=
              current.paymentIntentClientSecret || previous.isFinishingPayment != current.isFinishingPayment,
          builder: (context, state) {
            return state.isLoading || (state.isFinishingPayment && state.isLoading)
                ? const LoadingState() : (state.isFinishingPayment && state.isLoading == false) ? const SuccessState() :
                 const AddBalanceBody();
          },
          listener: (ctx, state) async {
            if (state.errorMessage.isNotEmpty) {
              DefaultSnackBar.show(context: ctx, message: state.errorMessage);
              ctx.read<AddBalanceCubit>().cancelPayment();
              return;
            }

            if(state.isLoading && state.isFinishingPayment){
              await injector<SaveLastTransactionIdUseCase>().call(state.trx);
              ctx.read<StatusTransactionBloc>().add(
                const StatusTransactionEvent.fetchLastTransactionStatus(),
              );
              ctx.read<AuthentificationBloc>().add(AuthentificationEvent.getSignedInUser());
              ctx.read<AddBalanceCubit>().finishPayment();
              ctx.pop();
              ctx.go(Routes.home);
            }

            if (state.paymentIntentClientSecret.isNotEmpty && state.isLoading == false && state.isFinishingPayment == false) {
              await Stripe.instance.initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: state.paymentIntentClientSecret,
                  merchantDisplayName: "My Store",
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: 'US'),
                  googlePay: const PaymentSheetGooglePay(
                    merchantCountryCode: 'US',
                    testEnv: true,
                    buttonType: PlatformButtonType.book,
                  ),
                ),
              );


              await Stripe.instance.presentPaymentSheet();
              ctx.read<AddBalanceCubit>().startingPayment();

              // final bool? isSuccess = await context.push<bool>(Routes.payment, extra: { 'url': state.paymentUrl, 'trx': state.trx, 'is_from_balance': true });
              // if(isSuccess == true){
              //   await Future.delayed(const Duration(milliseconds: 500));
              //   context.pop<bool>(true);
              // }
            }

          },
        ),
      ),
    );
  }
}
