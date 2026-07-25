
import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_status_model.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_url_model.dart';
import 'package:esim_mob_app/features/deposit/data/models/payment_intent_result_model.dart';
import 'package:retrofit/retrofit.dart';

part 'deposit_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class DepositRemoteDataSource{
  factory DepositRemoteDataSource(Dio dio, {String? baseUrl}) = _DepositRemoteDataSource;

  @POST('v1/deposit/url')
  Future<DepositUrlModel> fetchDepositUrl({@Body() required Map<String, dynamic> data});

  @GET('v1/deposit/status')
  Future<DepositStatusModel> getDepositStatus({@Query('trx') required String trx});

  @POST('v1/deposit')
  Future<PaymentIntentResultModel> fetchPaymentIntent({@Body() required Map<String, dynamic> data});
}
