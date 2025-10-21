
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';

abstract interface class PromoCodeRepository{
  Future<PromoCode> checkPromoCode({required String promoCode});
}