import 'package:esim_mob_app/common/theme/extension/color/color_extension.dart';
import 'package:esim_mob_app/common/widgets/scaffold/default_scaffold.dart';
import 'package:esim_mob_app/common/widgets/state/loading_state.dart';
import 'package:esim_mob_app/common/widgets/state/payment_succesfult_state.dart';
import 'package:esim_mob_app/common/widgets/text/default_text.dart';
import 'package:esim_mob_app/features/auth/presentation/bloc/authentification_bloc.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/check_promo_code_use_case.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_balance.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_card_use_case.dart';
import 'package:esim_mob_app/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:esim_mob_app/features/checkout/presentation/widgets/checkout_body.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:go_router/go_router.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.tariff, required this.image, required this.country, required this.type, required this.countryCode, this.regionId});

  final PackageModel tariff;
  final String? image;
  final String country;
  final String type;
  final String countryCode;
  final num? regionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutBloc(
          purchaseESimByCardUseCase: injector<PurchaseESimByCardUseCase>(),
          purchaseESimByBalanceUseCase: injector<PurchaseESimByBalanceUseCase>(),
          checkPromoCodeUseCase: injector<CheckPromoCodeUseCase>(),
          tariff: tariff,
          esimLocation: countryCode,
          type: type,
        regionId: regionId,
      ),
      child: DefaultScaffold(
        backgroundColor: Theme.of(context).extension<ColorExtension>()!
            .cardBorder,
        appBar: AppBar(
          backgroundColor: Theme.of(context).extension<ColorExtension>()!
              .cardBorder,
          elevation: 0,
          title: const DefaultText.bodySmall('Checkout'),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back_ios, size: 24,
              color: Theme.of(context).extension<ColorExtension>()!.text,),
          ),
        ),
        body: Stack(
          children: [
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                return state.map(
                    initial: (_) => CheckoutBody(country: country, image: image,),
                    success: (_) => PaymentSuccessfulState(tariffModel: tariff),
                    loading: (_) => const LoadingState(),
                    failure: (s) => CheckoutBody(country: country, image: image,),
                    paymentLoading: (s) => const LoadingState(),
                    paymentSuccess: (s) => PaymentSuccessfulState(tariffModel: tariff),
                  loadingPromoCode: (_) => CheckoutBody(country: country, image: image,),
                );
              },
            ),
            Positioned.fill(
              child: BlocBuilder<AuthentificationBloc, AuthentificationState>(builder: (context, state) {
                return state.maybeMap(orElse: () => Container(), loading: (s) => const LoadingState());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
