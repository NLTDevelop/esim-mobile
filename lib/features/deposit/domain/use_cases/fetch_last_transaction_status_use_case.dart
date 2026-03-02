

import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_status_model.dart';
import 'package:esim_mob_app/features/deposit/domain/repositories/deposit_repository.dart';

class FetchLastTransactionStatusUseCase extends UseCase<DepositStatusModel, String> {

  const FetchLastTransactionStatusUseCase({
    required final DepositRepository depositRepository,
  }) : _depositRepository = depositRepository;

  final DepositRepository _depositRepository;
  @override
  Future<DepositStatusModel> call(String params) async{
    return await _depositRepository.getDepositStatus(trx: params);
  }

}

