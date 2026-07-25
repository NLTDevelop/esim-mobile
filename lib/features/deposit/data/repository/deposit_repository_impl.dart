
import 'package:esim_mob_app/features/deposit/data/data_sources/remote/deposit_remote_data_source.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_status_model.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_url_model.dart';
import 'package:esim_mob_app/features/deposit/data/models/payment_intent_result_model.dart';
import 'package:esim_mob_app/features/deposit/domain/repositories/deposit_repository.dart';

class DepositRepositoryImpl implements DepositRepository{
  final DepositRemoteDataSource _depositRemoteDataSource;

  const DepositRepositoryImpl({
    required final DepositRemoteDataSource depositRemoteDataSource,
  }) : _depositRemoteDataSource = depositRemoteDataSource;

  @override
  Future<DepositUrlModel> fetchUrlBalance({required num amount, required String currencyCode}) async {
    return await _depositRemoteDataSource.fetchDepositUrl(data: {
      'amount': amount,
      'currency_code': currencyCode
    });
  }

  @override
  Future<DepositStatusModel> getDepositStatus({required String trx}) async {
    return await _depositRemoteDataSource.getDepositStatus(trx: trx);
  }

  @override
  Future<PaymentIntentResultModel> fetchPaymentIntent({required num amount, required String currencyCode}) async{
    return await _depositRemoteDataSource.fetchPaymentIntent(data: { 'amount': amount, 'currency_code': currencyCode});
  }

}