
import 'package:esim_mob_app/features/checkout/data/data_sources/remote/checkout_remote_data_source.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_balance_response.dart';
import 'package:esim_mob_app/features/checkout/data/model/purchased_esim_by_card_response.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/checkout_repository.dart';

class CheckoutRepositoryImpl implements CheckoutRepository{

  const CheckoutRepositoryImpl({required CheckoutRemoteDataSource checkoutRemoteDataSource}) : _checkoutRemoteDataSource = checkoutRemoteDataSource, super();
  final CheckoutRemoteDataSource _checkoutRemoteDataSource;
  @override
  Future<PurchasedESimByBalanceResponse> purchaseESimByBalance({required String type, required String location, required String package, required String promoCode}) async{
    return await _checkoutRemoteDataSource.purchaseESimUsingBalance(data: {
      'type': type,
      'location': location,
      'package': package,
      'promo_code': promoCode
    });
  }

  @override
  Future<PurchasedESimByCardResponse> purchaseESimByCard({required String type, required String location, required String package, required String promoCode}) async{
    return await _checkoutRemoteDataSource.purchaseESimUsingCard(data: {
      'type': type,
      'location': location,
      'package':package,
      'promo_code': promoCode,
    });
  }

}