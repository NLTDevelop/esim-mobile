
import 'package:esim_mob_app/features/deposit/data/models/deposit_status_model.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_url_model.dart';

abstract interface  class DepositRepository{
  Future<DepositUrlModel> fetchUrlBalance({
    required num amount, required String currencyCode
});

  Future<DepositStatusModel> getDepositStatus({required String trx});
}