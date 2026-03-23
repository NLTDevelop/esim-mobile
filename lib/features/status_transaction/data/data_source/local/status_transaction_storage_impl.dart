import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/features/status_transaction/data/data_source/local/status_transaction_storage.dart';


class StatusTransactionStorageImpl implements StatusTransactionStorage {
  const StatusTransactionStorageImpl({
    required final FlutterSecureStorageDao secureStorageDao,
  }) : _secureStorageDao = secureStorageDao;

  final FlutterSecureStorageDao _secureStorageDao;
  @override
  Future<void> saveLastTransaction(String transactionId) async => await _secureStorageDao.writeSecureString(
    'transactionId',
    transactionId,
  );

  @override
  Future<String?> getLastTransactionId() async => await _secureStorageDao.readSecureString('transactionId');

}
