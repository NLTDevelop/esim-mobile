
import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:retrofit/retrofit.dart';

part 'promo_code_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class PromoCodeRemoteDataSource{
  factory PromoCodeRemoteDataSource(Dio dio, {String? baseUrl}) = _PromoCodeRemoteDataSource;

  @GET('v1/promocode/{code}')
  Future<PromoCode> validatePromoCode({@Path('code') required String code });

}
