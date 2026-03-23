import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/state/failure_state.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/state/payment_failed_state.dart';
import 'package:esim_mob_app/common/widgets/state/payment_succesfult_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/fetch_top_up_list_use_case.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/top_up_by_balance_use_case.dart';
import 'package:esim_mob_app/features/top_up/domain/use_cases/top_up_by_card_use_case.dart';
import 'package:esim_mob_app/features/top_up/presentation/bloc/topup_bloc.dart';
import 'package:esim_mob_app/features/top_up/presentation/widgets/top_up_body.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key, required this.activationId});

  final int activationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopupBloc(topUpByBalanceUseCase: injector<TopUpByBalanceUseCase>(), topUpByCardUseCase: injector<TopUpByCardUseCase>(), fetchTopUpListUseCase: injector<FetchTopUpListUseCase>(), activationId: activationId)..add(const TopupEvent.fetchTopUpPackages()),
      child: DefaultScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actionsPadding: const EdgeInsets.only(right: 12),
          actions: [],
          title: const DefaultText.bodySmall('Top up eSIM'),
          centerTitle: true,
        ),
        body: BlocBuilder<TopupBloc, TopupState>(
  builder: (context, state) {
    return state.map(
        initial: (_) => const LoadingState(),
        loading: (_) => const LoadingState(),
        loaded: (s) => const TopUpBody(),
        failure: (s) => FailureState(onTap: (){}, message: 'Error: ${s.message}',),
        paymentFailure: (s) => PaymentFailedState(message: s.message),
        paymentSuccess: (s) {
          final tariffModel = s.packages[s.selectedIndex];
          final packageModel = PackageModel(price: tariffModel.price, currency: tariffModel.currency, packageId: tariffModel.packageId, dataInMb: tariffModel.dataInMB, validDays: tariffModel.validDays);

          return PaymentSuccessfulState(tariffModel: packageModel);
        },
    );
  },
),
      ),
    );
  }
}
