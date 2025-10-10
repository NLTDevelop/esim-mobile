

import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:esim_mob_app/features/auth/domain/repository/auth_repository.dart';


final class AuthRepositoryImpl  implements AuthRepository {
  // final AuthRemoteDataSource _authRemoteDataSource;
  //
  // const AuthRepositoryImpl({
  //   required final AuthRemoteDataSource authRemoteDataSource,
  // }) : _authRemoteDataSource = authRemoteDataSource;

  final String token = 'afagfwf32t24f4fwgwvsdq12';

  @override
  Future<TokenModel> loginWithGoogle({
    required final String email,
    required final String password,
  }) async{
    // return await _authRemoteDataSource.loginWithGoogle(
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // );

    //await Future.delayed(const Duration(seconds: 1));
    return TokenModel(accessToken: token);
  }

  @override
  Future<TokenModel> loginWithApple({
    required final String email,
    required final String password,
  })  async {
    // return await _authRemoteDataSource.loginWithApple(
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // );

    await Future.delayed(const Duration(seconds: 1));
    return TokenModel(accessToken: token);
  }


  @override
  Future<TokenModel> refreshToken({
    required final String refreshToken,
  }) async {
    // return await _authRemoteDataSource.refreshToken(
    //   refreshToken: refreshToken,
    // );
    await Future.delayed(const Duration(seconds: 1));
    return TokenModel(accessToken: token);
  }

}
