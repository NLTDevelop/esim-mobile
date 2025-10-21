import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/core/constants/secure_storage_keys.dart';
import 'package:esim_mob_app/features/notifcations/data/data_sources/local/fcm_token_storage.dart';


final class FcmTokenStorageImpl implements FcmTokenStorage {

  const FcmTokenStorageImpl({
    required final FlutterSecureStorageDao secureStorageDao,
  }) : _secureStorageDao = secureStorageDao;

  final FlutterSecureStorageDao _secureStorageDao;

  @override
  Future<void> deleteFcmToken() async {
    await _secureStorageDao.delete(SecureStorageKeys.fcmToken);
    ///await FirebaseNotification().deleteFcmToken();
  }

  @override
  Future<String?> getFcmToken() async {
    return  await _secureStorageDao.readSecureString(SecureStorageKeys.fcmToken);
  }

  @override
  Future<void> saveFcmToken(String token) async {
    return await _secureStorageDao.writeSecureString(SecureStorageKeys.fcmToken, token);
  }
}
