

import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/features/onboarding/data/data_sources/local/first_start_app_storage.dart';

class FirstStartAppStorageImpl implements FirstStartAppStorage {
  FirstStartAppStorageImpl({required final FlutterSecureStorageDao secureStorageDao})
      : _secureStorageDao = secureStorageDao;

  final FlutterSecureStorageDao _secureStorageDao;

  @override
  bool load(){
    return _secureStorageDao.readBool('first_start_app') ?? true;
  }

  @override
  Future<void> save(bool isFirstRun) async {
    await _secureStorageDao.writeBool('first_start_app', isFirstRun);
  }

  @override
  Future<void> clear() async {
    await _secureStorageDao.delete('first_start_app');
  }
}
