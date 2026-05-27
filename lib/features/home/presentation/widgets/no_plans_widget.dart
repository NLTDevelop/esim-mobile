import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/button/primary_button.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/home/domain/use_cases/fetch_user_esim_by_id_use_case.dart';
import 'package:esim_mob_app/features/home/presentation/widgets/pending_transaction_container.dart';
import 'package:esim_mob_app/features/install_esim/presentation/cubit/install_esim_cubit.dart';
import 'package:esim_mob_app/features/install_esim/presentation/widgets/bottom_sheets/install_esim_bottom_sheet.dart';
import 'package:esim_mob_app/features/status_transaction/presentation/bloc/status_transaction_bloc.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NoPlansWidget extends StatelessWidget {
  const NoPlansWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<StatusTransactionBloc, StatusTransactionState>(
                builder: (context, state){
                  return state.maybeMap(orElse: () => Container(), pending: (s) => Padding(padding: const EdgeInsets.only(bottom: 16), child: PendingStatusWidget()));
                }),
            const DefaultText.bodyMedium('No store... yet!'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: DefaultText.labelMedium('Purchase a plan for it to appear',
                color: Theme.of(context).extension<ColorExtension>()!.text,),
            ),
            PrimaryButton(onTap: () {
              context.go(Routes.store);
            }, text: 'Explore store'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // void _showInstallESimBottomSheet(BuildContext context, int index) {
  //   showModalBottomSheet(
  //       context: context,
  //       useRootNavigator: true,
  //       useSafeArea: true,
  //       isScrollControlled: true,
  //       builder: (ctx) =>
  //           BlocProvider(
  //             create: (ctx) =>
  //                 InstallESimCubit(userESims: [
  //                   UserESimModel(
  //                       id: 1,
  //                       mb: 1024,
  //                       days: 3,
  //                       usedMb: 0,
  //                       balanceMb: 1024,
  //                       balanceDays: 3,
  //                       country: 'Japan',
  //                       status: 'ACTIVE',
  //                       price: 1.00,
  //                       currencyCode: 'USD',
  //                       canAutoTopUp: false,
  //                       autoTopUpEnabled: true,
  //                       autoTopUpPackage: '',
  //                       canTopUp: true,
  //                       createdAt: DateTime.now(),
  //                       topUpHistory: []),
  //                 ], fetchUserESimByIdUseCase: injector<FetchUserESimByIdUseCase>()
  //                 ),
  //             child: InstallESimBottomSheet(),
  //           ));
  // }
}
