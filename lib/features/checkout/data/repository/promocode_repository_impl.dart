

import 'package:esim_mob_app/core/exceptions/wrong_coupon_exception.dart';
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/promo_code_repository.dart';


class PromoCodeRepositoryImpl implements PromoCodeRepository{
  @override
  Future<PromoCode> checkPromoCode({required String promoCode}) async{
    await Future.delayed(const Duration(milliseconds: 500));
    if(promoCode == '12345678'){
      return const PromoCode(title: 'Discount 10%', discountPercents: 10);
    }
    throw const WrongCouponException();
  }

}