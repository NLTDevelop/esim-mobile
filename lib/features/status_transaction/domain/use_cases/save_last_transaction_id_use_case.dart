


import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/status_transaction/domain/repositories/status_transaction_repository.dart';

class SaveLastTransactionIdUseCase extends UseCase<void, String> {

  const SaveLastTransactionIdUseCase({
    required final StatusTransactionRepository statusTransactionRepository,
  }) : _statusTransactionRepository = statusTransactionRepository;

  final StatusTransactionRepository _statusTransactionRepository;
  @override
  Future<void> call(String params) async{
    return await _statusTransactionRepository.saveLastTransaction(params);
  }

}

