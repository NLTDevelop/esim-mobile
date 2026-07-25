
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/checkout/data/model/payment_by_card_result_intent.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/checkout_repository.dart';

class PurchaseESimByCardUseCase extends UseCase<PaymentByCardResultIntent, PurchaseESimParams> {
  final CheckoutRepository _checkoutRepository;

  const PurchaseESimByCardUseCase({
    required final CheckoutRepository checkoutRepository,
  }) : _checkoutRepository = checkoutRepository;

  @override
  Future<PaymentByCardResultIntent> call(
      final PurchaseESimParams params,
      ) async =>
      await _checkoutRepository.purchaseESimByCard(type: params.type, location: params.location, package: params.package, promoCode: params.promoCode);
}

class PurchaseESimParams{

  const PurchaseESimParams({
    required this.type,
    required this.location,
    required this.package,
    required this.promoCode
});

  final String type;
  final String location;
  final String package;
  final String? promoCode;
}