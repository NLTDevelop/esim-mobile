import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/plans_response_model.dart';
import 'package:esim_mob_app/features/store/domain/repository/plan_esim_repository.dart';

class FetchRegionalESimsUseCase extends UseCase<List<PlanModel>, FetchRegionalESimsParams> {
  final PlanESimRepository _planESimRepository;

  const FetchRegionalESimsUseCase({
    required final PlanESimRepository planESimRepository,
  }) : _planESimRepository = planESimRepository;

  @override
  Future<List<PlanModel>> call(
      final FetchRegionalESimsParams params,
      ) async {
    return await _planESimRepository.fetchRegionalPlansESim(regionalId: params.regionalId, currencyCode: params.currencyCode);
  }
}

class FetchRegionalESimsParams {
  final String regionalId;
  final String currencyCode;

  const FetchRegionalESimsParams({
    required this.regionalId,
    required this.currencyCode,
  });
}
