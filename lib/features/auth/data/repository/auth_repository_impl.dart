

import 'dart:async';
import 'dart:io';
import 'package:esim_mob_app/core/constants/variables.dart';

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
  Future<TokenModel> loginWithGoogle({
    required String fcmToken,
  }) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(

        serverClientId: Platform.isAndroid
            ? '111365015516-06fg2qqere9ogs7pjfab0682fk7ih9k6.apps.googleusercontent.com'
            : null,
        scopes: [
          'email',
          'profile',
          'openid',
        ],
      );

      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google sign-in cancelled by user');
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      if (googleAuth.accessToken == null) {
        throw Exception('Failed to get Google access token');
      }

      return await _authRemoteDataSource.signInGoogle(
        data: {
          'access_token': googleAuth.accessToken,
          'id_token': googleAuth.idToken,
        },
        fcmToken: fcmToken,
      );
    } catch (e, st) {
      debugPrint('❌ Google Sign-In Error (v6): $e');
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
        AppleIDAuthorizationScopes.fullName
      ], webAuthenticationOptions: WebAuthenticationOptions(clientId: kClientID, redirectUri: Uri.parse(kAppleSignInProdReturnUrl)),
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
