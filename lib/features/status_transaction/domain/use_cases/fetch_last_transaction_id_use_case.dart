


import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/status_transaction/domain/repositories/status_transaction_repository.dart';

class FetchLastTransactionIdUseCase extends UseCase<String?, NoParams> {

  const FetchLastTransactionIdUseCase({
    required final StatusTransactionRepository statusTransactionRepository,
  }) : _statusTransactionRepository = statusTransactionRepository;

  final StatusTransactionRepository _statusTransactionRepository;
  @override
  Future<String?> call(NoParams params) async {
    return await _statusTransactionRepository.fetchLastTransactionId();
  }

}

