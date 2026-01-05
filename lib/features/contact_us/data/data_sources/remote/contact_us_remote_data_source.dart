

import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:retrofit/retrofit.dart';

part 'contact_us_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class ContactUsRemoteDataSource{
  factory ContactUsRemoteDataSource(Dio dio, {String? baseUrl}) = _ContactUsRemoteDataSource;

  @POST('v1/contact')
  Future<void> sendMessage({@Body() required Map<String, dynamic> data});
}