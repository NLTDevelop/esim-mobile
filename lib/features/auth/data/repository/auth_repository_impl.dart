

import 'dart:async';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:esim_mob_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:esim_mob_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


final class AuthRepositoryImpl  implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepositoryImpl({
    required final AuthRemoteDataSource authRemoteDataSource,
  }) : _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<TokenModel> loginWithGoogle() async{
    try {

      await GoogleSignIn.instance.initialize(serverClientId: Platform.isAndroid ? dotenv.env['GOOGLE_SIGN_IN_CLIENT_ID'] : null, );

      final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate(scopeHint: ['email']);

      final GoogleSignInClientAuthorization? clientAuthorization = await googleUser.authorizationClient.authorizationForScopes(['email']);
      // String acceess_token = "ya29.a0ATi6K2sengWjsJaR8jd2KnGymTZZYJG4UpHaGvDNRkN8rW3GID4AgkUzS7T72zjc-Ko95cPt9yVUOEzt3E2vW3mcDolOV7BX1t4QXwVhslMtH5D66dBCbNoBRHveG1vUeVpjsq-SXHrTgG4PbgnlIfzOswCemp2NnmqBbNKOgARIp4XHTLSaO5INCmKhE4M_1eqhQ57wVrcApzIxJdEXzZKrwE473eIWv5aiXa04-56aLt0syu12_6jbRySZHDaBNyPLgaSOUfcdwcUaCgYKAa4SARcSFQHGX2MiVzm7wD9fl0RPQFRvzd-fWw0278";

      if (clientAuthorization == null) {
        throw Exception('Google authorization cancelled or failed.');
      }


      return await _authRemoteDataSource.signInGoogle(
        data: {
          'access_token': clientAuthorization.accessToken,
        },
      );

      // return TokenModel(accessToken: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjYzLCJleHAiOjE3NjQ3NjAyMDV9.nYZIf1l-xdu2ZcNx68iiQoBf67M17V8XdsnuKJqCZZY", refreshToken: "SFUIIAGvmEbL/YUpyJio6HYZXOiEw5rbYlH1J7G4J0cpIXRS58ovXORYFsMusVj6", accessTokenExpirationAt: "2025-12-17T10:10:05.060+00:00", refreshTokenExpirationAt: "2025-12-03T11:10:05.060+00:00");
    } catch (e, st) {
      debugPrint('❌ Google Sign-In Error: $e');
      debugPrintStack(stackTrace: st);
      rethrow;
    }

    // await Future.delayed(const Duration(seconds: 1));
    // return TokenModel(accessToken: token, accessTokenExpirationAt: '', refreshToken: '', refreshTokenExpirationAt: '');
  }

  @override
  Future<TokenModel> loginWithIOS() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ],
    );
    if (credential.userIdentifier != null && credential.identityToken != null) {
      Map<String, dynamic> variable = {
        "access_token": credential.identityToken
      };


      print("Authorization Code: ${credential.authorizationCode}");
      print("User Identifier: ${credential.userIdentifier}");
      // final uri = Uri.parse('http://localhost:3000/api/auth/ios');
      // final response = await http.post(
      //   uri,
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode({
      //     'access_token': credential.identityToken, // token from sign_in_with_apple
      //   }),
      // );
      // final Map<String,dynamic> body = jsonDecode(response.body);
      // print(body);
      // return TokenModel.fromJson(body);

      return await _authRemoteDataSource.signInIOS(
        data: variable,
      );
    }
    throw UnimplementedError();
  }

  @override
  Future<TokenModel> refreshToken({
    required final String refreshToken,
  }) async {
    // return await _authRemoteDataSource.refreshToken(
    //   refreshToken: refreshToken,
    // );
    // await Future.delayed(const Duration(seconds: 1));
    // return TokenModel(accessToken: token);
    throw Exception('Refresh token');
  }

}
