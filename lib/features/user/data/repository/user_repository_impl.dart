

import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:esim_mob_app/features/user/data/models/delete_request_response.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  const UserRepositoryImpl({
    required final UserRemoteDataSource userRemoteDataSource,
  }) : _userRemoteDataSource = userRemoteDataSource;

  @override
  Future<UserModel> getCurrentUser() async => await _userRemoteDataSource.getUser();

  @override
  Future<UserModel> updateUser({required String currencyCode}) async => await _userRemoteDataSource.updateUser(data: {
    'currency_code': currencyCode
  });

  @override
  Future<DeleteRequestResponse> deleteUserAccount() async => await _userRemoteDataSource.requestDeletingAccount();

  @override
  Future<List<UserESimModel>> getESimList() async => await _userRemoteDataSource.getESimList();

  @override
  Future<UserESimModel> getESimById({required int id}) async => await _userRemoteDataSource.getESimById( id: id);

  @override
  Future<void> sendCodeForDeleteAccount({required String code}) async => await _userRemoteDataSource.sendDeleteCode(data: {'code': code});

}
