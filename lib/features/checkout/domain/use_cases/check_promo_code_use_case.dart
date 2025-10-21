

import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/promo_code_repository.dart';

class CheckPromoCodeUseCase extends UseCase<PromoCode, PromoCodeParams> {
  final PromoCodeRepository _promoCodeRepository;

  const CheckPromoCodeUseCase({
    required final PromoCodeRepository promoCodeRepository,
  }) : _promoCodeRepository = promoCodeRepository;

  @override
  Future<PromoCode> call(
      final PromoCodeParams params,
      ) async =>
      await _promoCodeRepository.checkPromoCode(
        promoCode: params.promoCode,
      );
}


class PromoCodeParams {
  final String promoCode;


  const PromoCodeParams({
    required this.promoCode,
  });
}
