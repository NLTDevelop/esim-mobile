

import 'package:esim_mob_app/features/auth/data/models/token_model.dart';

abstract interface class AuthRepository {
  Future<TokenModel> loginWithGoogle({
    required final String email,
    required final String password,
  });

  Future<TokenModel> loginWithApple({
    required final String email,
    required final String password,
  });

  Future<TokenModel> refreshToken({
    required final String refreshToken,
  });
}
