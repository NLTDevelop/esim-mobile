import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:retrofit/http.dart';

part 'auth_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String? baseUrl}) = _AuthRemoteDataSource;
  @POST('v1/auth/google/access-token')
  Future<TokenModel> signInGoogle({
    @Body() required Map<String, dynamic> data,
    @Header('Device-Id') required String fcmToken
  });

  @POST('v1/auth/apple/access-token')
  Future<TokenModel> signInIOS({
    @Body() required Map<String, dynamic> data,
    @Header('Device-Id') required String fcmToken
  });

  // @GET('refresh')
  // Future<TokenModel> refreshToken({
  //   @Header('Authorization') required final String refreshToken,
  // });

}