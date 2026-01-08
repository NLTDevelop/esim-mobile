
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_balance_response.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_card_response.dart';

abstract interface class CheckoutRepository{
  Future<PurchasedESimByCardResponse> purchaseESimByCard({required String type, required String location, required String package, required String promoCode});
  Future<PurchasedESimByBalanceResponse> purchaseESimByBalance({required String type, required String location, required String package, required String promoCode});
}