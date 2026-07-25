
import 'package:esim_mob_app/features/checkout/data/model/payment_by_card_result_intent.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_balance_response.dart';


abstract interface class CheckoutRepository{
  Future<PaymentByCardResultIntent> purchaseESimByCard({required String type, required String location, required String package, required String? promoCode});
  Future<PurchasedESimByBalanceResponse> purchaseESimByBalance({required String type, required String location, required String package, required String? promoCode});
}