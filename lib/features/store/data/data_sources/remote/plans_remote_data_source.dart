
import 'package:dio/dio.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/plans_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:retrofit/http.dart';

part 'plans_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class PlansRemoteDataSource {
  factory PlansRemoteDataSource(Dio dio, {String? baseUrl}) = _PlansRemoteDataSource;
  @GET('v1/esim/regional')
  Future<List<PlanModel>> fetchRegionalPlans({
    @Query('region_id') required String regionId,
    @Query('currency_code') required String currencyCode
  });

  @GET('v1/esim/local')
  Future<List<PlanModel>> fetchLocalPlans({
    @Query('country_code') required String countryCode,
    @Query('currency_code') required String currencyCode
  });

}