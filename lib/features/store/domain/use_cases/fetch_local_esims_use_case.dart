import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/plans_response_model.dart';
import 'package:esim_mob_app/features/store/domain/repository/plan_esim_repository.dart';

class FetchLocalESimsUseCase extends UseCase<List<PlanModel>, FetchLocalESimsParams> {
  final PlanESimRepository _planESimRepository;

  const FetchLocalESimsUseCase({
    required final PlanESimRepository planESimRepository,
  }) : _planESimRepository = planESimRepository;

  @override
  Future<List<PlanModel>> call(
      final FetchLocalESimsParams params,
      ) async {
    return await _planESimRepository.fetchLocalPlansESim(countryCode: params.countryCode, currencyCode: params.currencyCode);
  }
}

class FetchLocalESimsParams {
  final String countryCode;
  final String currencyCode;

  const FetchLocalESimsParams({
    required this.countryCode,
    required this.currencyCode,
  });
}
