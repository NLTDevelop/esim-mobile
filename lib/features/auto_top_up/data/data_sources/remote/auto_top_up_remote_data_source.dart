
import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/responses/activation_top_up_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_package_list_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auto_top_up_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class AutoTopUpRemoteDataSource{
  factory AutoTopUpRemoteDataSource(Dio dio, {String? baseUrl}) = _AutoTopUpRemoteDataSource;

  @GET('v1/esim/{id}/packages')
  Future<UserESimPackageListModel> fetchAutoTopUpPackages({@Path('id') required int id});

  @POST('v1/esim/{id}/auto-topup')
  Future<ActivationTopUpResponse> updateActivationTopUp({@Path('id') required int id, @Body() required Map<String, dynamic> data});

}
