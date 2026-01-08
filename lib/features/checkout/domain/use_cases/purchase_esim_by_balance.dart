
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_balance_response.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/checkout_repository.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_card_use_case.dart';

class PurchaseESimByBalanceUseCase extends UseCase<PurchasedESimByBalanceResponse, PurchaseESimParams> {
  final CheckoutRepository _checkoutRepository;

  const PurchaseESimByBalanceUseCase({
    required final CheckoutRepository checkoutRepository,
  }) : _checkoutRepository = checkoutRepository;

  @override
  Future<PurchasedESimByBalanceResponse> call(
      final PurchaseESimParams params,
      ) async =>
      await _checkoutRepository.purchaseESimByBalance(type: params.type, location: params.location, package: params.package, promoCode: params.promoCode);
}