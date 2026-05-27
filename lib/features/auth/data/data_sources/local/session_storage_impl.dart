import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/features/auth/data/data_sources/local/session_storage.dart';
import 'package:flutter/services.dart';

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
  Future<String?> getAccessToken()  async {
    try{
      final token = await _secureStorageDao.readSecureString('accessToken');
      return token;
    } catch(e) {
      if (e is PlatformException && e.code == 'BadPaddingException') {
        await _secureStorageDao.deleteAllSecureStorage();
      }
      return null;
    }
  }

  @override
  Future<void> cleanSession() async {
    await _secureStorageDao.deleteSecureData('accessToken');
  }
}
