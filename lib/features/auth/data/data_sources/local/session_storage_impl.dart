import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/local/session_storage.dart';

class SessionStorageImpl implements SessionStorage {
  const SessionStorageImpl({
    required final FlutterSecureStorageDao secureStorageDao,
  }) : _secureStorageDao = secureStorageDao;

  final FlutterSecureStorageDao _secureStorageDao;
  @override
  Future<void> saveAccessToken(String accessToken) async => await _secureStorageDao.writeSecureString(
    'accessToken',
    accessToken,
  );

  @override
  Future<String?> getAccessToken()  async => await _secureStorageDao.readSecureString('accessToken');

  @override
  Future<void> cleanSession() async {
    await _secureStorageDao.deleteSecureData('accessToken');
  }
}
