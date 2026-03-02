import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/snackbar/default_snackbar.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_cubit.dart';
import 'package:esim_mob_app/features/add_balance/presentation/bloc/add_balance_state.dart';
import 'package:esim_mob_app/features/add_balance/presentation/widgets/add_balance_body.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/deposit/domain/use_cases/add_balance_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.read<AuthentificationBloc>().state.user.when(authenticated: (s) => s.currency, notAuthenticated: () => ''));
    return BlocProvider(
      create: (context) => AddBalanceCubit(addBalanceUseCase: injector<AddBalanceUseCase>(), currency: context.read<AuthentificationBloc>().state.user.when(authenticated: (s) => s.currency ?? 'USD', notAuthenticated: () => '')),
      child: DefaultScaffold(
        appBar: AppBar(
          leading: GestureDetector(onTap: () {
            context.pop();
          },
              child: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).extension<ColorExtension>()!.text,)),
        ),
        body: BlocConsumer<AddBalanceCubit, AddBalanceState>(builder: (context, state){
          return state.isLoading ? const LoadingState() : const AddBalanceBody();
        }, listener: (context, state){
          if(state.errorMessage.isNotEmpty){
            DefaultSnackBar.show(context: context, message: state.errorMessage);
          }
          if(state.paymentUrl.isNotEmpty){
            context.push(Routes.payment, extra: { 'url': state.paymentUrl, 'trx': state.trx });
          }
        },),
      ),
    );
  }
}
