


import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/data/models/delete_request_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_list_model.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'user_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class UserRemoteDataSource {
   factory UserRemoteDataSource(Dio dio, {String? baseUrl}) = _UserRemoteDataSource;

  @GET('v1/profile')
  Future<AuthenticatedUserModel> getUser();

  @GET('v1/esim')
  Future<UserESimListModel> getESimList();

  @GET('v1/esim/{id}')
  Future<UserESimModel> getESimById({@Path() required int id});

  @POST('v1/profile/delete/request')
  Future<DeleteRequestResponse> requestDeletingAccount();

  @POST('v1/profile/delete/confirm')
  Future<void> sendDeleteCode({@Body() required Map<String, dynamic> data});
}
