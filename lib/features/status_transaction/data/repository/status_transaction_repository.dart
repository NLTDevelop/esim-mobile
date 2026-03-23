


import 'package:esim_mob_app/features/status_transaction/data/data_source/local/status_transaction_storage.dart';
import 'package:esim_mob_app/features/status_transaction/domain/repositories/status_transaction_repository.dart';

class StatusTransactionRepositoryImpl implements StatusTransactionRepository{
  final StatusTransactionStorage _statusTransactionStorage;

  const StatusTransactionRepositoryImpl({
    required final StatusTransactionStorage statusTransactionStorage,
  }) : _statusTransactionStorage = statusTransactionStorage;


  @override
  Future<String?> fetchLastTransactionId() async {
    return await _statusTransactionStorage.getLastTransactionId();
  }

  @override
  Future<void> saveLastTransaction(String transactionId) async {
    await _statusTransactionStorage.saveLastTransaction(transactionId);
  }

}