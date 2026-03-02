
import 'package:esim_mob_app/features/store/data/data_sources/remote/plans_remote_data_source.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/plans_response_model.dart';
import 'package:esim_mob_app/features/store/domain/repository/plan_esim_repository.dart';

final class PlanESimRepositoryImpl  implements PlanESimRepository {
  final PlansRemoteDataSource _plansRemoteDataSource;

  const PlanESimRepositoryImpl({
    required final PlansRemoteDataSource plansRemoteDataSource,
  }) : _plansRemoteDataSource = plansRemoteDataSource;

  @override
  Future<List<PlanModel>> fetchLocalPlansESim({required String countryCode, String? currencyCode}) async {
    return await _plansRemoteDataSource.fetchLocalPlans(currencyCode: currencyCode ?? 'USD', countryCode: countryCode);
  }

  @override
  Future<List<PlanModel>> fetchRegionalPlansESim({required String regionalId, String? currencyCode}) async{
    return await _plansRemoteDataSource.fetchRegionalPlans(regionId: regionalId, currencyCode: currencyCode ?? '');
  }



}
