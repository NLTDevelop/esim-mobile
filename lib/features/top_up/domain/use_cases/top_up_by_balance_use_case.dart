

import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/top_up/data/models/top_up_by_balance_response.dart';

import 'package:esim_mob_app/features/top_up/domain/respository/top_up_repository.dart';

class TopUpByBalanceUseCase extends UseCase<TopUpByBalanceResponse, TopUpByBalanceParams> {
  final TopUpRepository _topUpRepository;

  const TopUpByBalanceUseCase({
    required final TopUpRepository topUpRepository,
  }) : _topUpRepository = topUpRepository;

  @override
  Future<TopUpByBalanceResponse> call(
      TopUpByBalanceParams params
      ) async => await _topUpRepository.topUpByBalance(package: params.package, activationId: params.activationId, promoCode: params.promoCode);
}


class TopUpByBalanceParams{

  TopUpByBalanceParams({
    required this.activationId,
    required this.promoCode,
    required this.package,
  });
  final int activationId;
  final String package;
  final String? promoCode;
}