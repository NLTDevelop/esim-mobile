

import 'package:esim_mob_app/features/checkout/data/data_sources/remote/promo_code_remote_data_source.dart';
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:esim_mob_app/features/checkout/domain/repository/promo_code_repository.dart';


class PromoCodeRepositoryImpl implements PromoCodeRepository{

  const PromoCodeRepositoryImpl({required PromoCodeRemoteDataSource promoCodeRemoteDataSource}) : _promoCodeRemoteDataSource = promoCodeRemoteDataSource, super();
  final PromoCodeRemoteDataSource _promoCodeRemoteDataSource;

  @override
  Future<PromoCode> checkPromoCode({required String promoCode}) async{
    return await _promoCodeRemoteDataSource.validatePromoCode(code: promoCode);
  }

}