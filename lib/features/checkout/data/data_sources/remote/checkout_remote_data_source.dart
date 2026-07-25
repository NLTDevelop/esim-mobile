import 'package:dio/dio.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:esim_mob_app/features/checkout/data/model/payment_by_card_result_intent.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_balance_response.dart';
import 'package:retrofit/retrofit.dart';

part 'checkout_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class CheckoutRemoteDataSource{
  factory CheckoutRemoteDataSource(Dio dio, {String? baseUrl}) = _CheckoutRemoteDataSource;

  @POST('v1/esim/buy/balance')
  Future<PurchasedESimByBalanceResponse> purchaseESimUsingBalance({@Body() required Map<String, dynamic> data});

  @POST('v1/esim/buy/card')
  Future<PaymentByCardResultIntent> purchaseESimUsingCard({@Body() required Map<String, dynamic> data});

}
