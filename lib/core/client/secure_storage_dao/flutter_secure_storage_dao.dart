import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterSecureStorageDao {
  const FlutterSecureStorageDao({
    required final FlutterSecureStorage secureStorage,
    required final SharedPreferences sharedPreferences,
  }) : _secureStorage = secureStorage, _sharedPreferences = sharedPreferences ;

  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  Future<void> writeBool(String key, bool value) async{
    await _sharedPreferences.setBool(key, value);
  }

  Future<void> writeInt(String key, int value) async{
    await _sharedPreferences.setInt(key, value);
  }

  Future<void> writeSecureString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readSecureString(String key) async {
    return await _secureStorage.read(key: key);
  }



  bool? readBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  Future<int?> readInt(String key) async {
    String? value = await _secureStorage.read(key: key);
    if (value != null) {
      return int.tryParse(value);
    }
    return null;
  }

  Future<void> deleteSecureData(String key) async{
    await _secureStorage.delete(key: key);
  }

  Future<void> delete(String key) async{
    await _sharedPreferences.remove(key);
  }
}
