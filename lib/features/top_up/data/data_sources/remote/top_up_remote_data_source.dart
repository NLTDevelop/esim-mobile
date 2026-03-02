

import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/responses/activation_top_up_response.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/data/models/top_up_by_card_response.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_card_response.dart';
import 'package:esim_mob_app/features/top_up/data/models/top_up_by_balance_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';
import 'package:retrofit/retrofit.dart';

part 'top_up_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class TopUpRemoteDataSource{
  factory TopUpRemoteDataSource(Dio dio, {String? baseUrl}) = _TopUpRemoteDataSource;

  @GET('v1/esim/{id}/packages')
  Future<List<UserPackageModel>> fetchTopUpPackages({@Path('id') required int id});

  @POST('v1/esim/topup/balance')
  Future<TopUpByBalanceResponse> topUpByBalance({@Body() required Map<String, dynamic> data});
}
