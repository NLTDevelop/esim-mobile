

import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  const UserRepositoryImpl({
    required final UserRemoteDataSource userRemoteDataSource,
  }) : _userRemoteDataSource = userRemoteDataSource;

  @override
  Future<UserModel> getCurrentUser() async => await _userRemoteDataSource.getUser();

  @override
  Future<void> deleteUserAccount() async => await _userRemoteDataSource.deleteUserAccount();
}
