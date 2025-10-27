
import 'dart:convert';

import 'package:esim_mob_app/core/client/secure_storage_dao/flutter_secure_storage_dao.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/data/data_sources/local/user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource{
  const UserLocalDataSourceImpl({
    required final FlutterSecureStorageDao secureStorageDao,
  }) : _secureStorageDao = secureStorageDao;

  final FlutterSecureStorageDao _secureStorageDao;

  @override
  Future<AuthenticatedUserModel?> getUser() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final String json = await _secureStorageDao.readSecureString('user') ?? '{}';
    AuthenticatedUserModel? user = AuthenticatedUserModel.fromJson(jsonDecode(json));
    return user;
  }

  @override
  Future<void> saveUser(AuthenticatedUserModel user) async {
    String json = jsonEncode({'id': user.id, 'email': user.email, 'eSims': user.eSims.map((e) => e.toJson()).toList()});
    print(json);
    await _secureStorageDao.writeSecureString('user', json);
  }

}