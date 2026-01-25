

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


      if (clientAuthorization == null) {
        throw Exception('Google authorization cancelled or failed.');
      }


      return await _authRemoteDataSource.signInGoogle(
        data: {
          'access_token': clientAuthorization.accessToken,
        },
      );

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
