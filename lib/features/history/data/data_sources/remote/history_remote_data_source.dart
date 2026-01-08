
import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/history/data/model/history_model.dart';
import 'package:retrofit/retrofit.dart';

part 'history_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class HistoryRemoteDataSource{
  factory HistoryRemoteDataSource(Dio dio, {String? baseUrl}) = _HistoryRemoteDataSource;

  @GET('v1/transactions')
  Future<HistoryModel> fetchHistory({@Query('page') required int page});

}