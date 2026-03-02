

import 'package:esim_mob_app/features/auth/data/models/token_model.dart';

abstract interface class AuthRepository {
  Future<TokenModel> loginWithGoogle({required String fcmToken});

  Future<TokenModel> loginWithIOS({ required String fcmToken});

  Future<TokenModel> refreshToken({
    required final String refreshToken,
  });
}
