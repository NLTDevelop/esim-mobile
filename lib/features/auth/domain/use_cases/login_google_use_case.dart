import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:esim_mob_app/features/auth/domain/repository/auth_repository.dart';

class LoginGoogleUseCase extends UseCase<TokenModel, LoginGoogleParams> {
  final AuthRepository _authRepository;

  const LoginGoogleUseCase({
    required final AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<TokenModel> call(LoginGoogleParams params) async =>
      await _authRepository.loginWithGoogle(fcmToken: params.fcmToken);
}

class LoginGoogleParams{
  LoginGoogleParams({
    required this.fcmToken
  });

  final String fcmToken;
}
