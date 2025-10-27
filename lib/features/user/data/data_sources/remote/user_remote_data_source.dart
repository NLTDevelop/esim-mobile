

// @RestApi(baseUrl: RestApi.baseUrl)
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/data/data_sources/local/user_local_data_source.dart';
import 'package:esim_mob_app/injector.dart';

class UserRemoteDataSource {
  // factory UserRemoteDataSource(Dio dio, {String? baseUrl}) = _UserRemoteDataSource;

  //@GET('users/me')
  Future<UserModel> getUser() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return await injector<UserLocalDataSource>().getUser() ?? const AuthenticatedUserModel(id: 1, email: 'test@gmail.com', eSims: []);
  }

  ///@DELETE('users')
  Future<void> deleteUserAccount() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
