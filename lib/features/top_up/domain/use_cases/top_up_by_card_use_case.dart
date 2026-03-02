
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/data/models/top_up_by_card_response.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/repositories/auto_top_up_repository.dart';

class TopUpByCardUseCase extends UseCase<TopUpByCardResponse, TopUpByCardParams> {
  final AutoTopUpRepository _autoTopUpRepository;

  const TopUpByCardUseCase({
    required final AutoTopUpRepository autoTopUpRepository,
  }) : _autoTopUpRepository = autoTopUpRepository;

  @override
  Future<TopUpByCardResponse> call(
      TopUpByCardParams params
      ) async => await _autoTopUpRepository.topUpByCard(package: params.package, activationId: params.activationId, promoCode: params.promoCode);
}


class TopUpByCardParams{

  TopUpByCardParams({
    required this.activationId,
    required this.promoCode,
    required this.package,
  });
  final int activationId;
  final String package;
  final String? promoCode;
}