

import 'dart:async';
import 'dart:io';
import 'package:esim_mob_app/core/constants/variables.dart';
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
  Future<TokenModel> loginWithGoogle({required String fcmToken}) async{
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
        fcmToken: fcmToken
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
  Future<TokenModel> loginWithIOS({required String fcmToken}) async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
      ], webAuthenticationOptions: WebAuthenticationOptions(clientId: kClientID, redirectUri: Uri.parse(kAppleSignInReturnUrl)),
    );

    if (credential.userIdentifier != null && credential.identityToken != null) {
      Map<String, dynamic> variable = {
        "access_token": credential.identityToken
      };

      debugPrint("User Identifier: ${credential.userIdentifier}");

      return await _authRemoteDataSource.signInIOS(
        data: variable,
        fcmToken: fcmToken
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
