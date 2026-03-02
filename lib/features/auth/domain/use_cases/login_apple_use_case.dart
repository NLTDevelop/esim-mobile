import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:esim_mob_app/features/auth/domain/repository/auth_repository.dart';

class LoginIOSUseCase extends UseCase<TokenModel, LoginIOSParams> {
  final AuthRepository _authRepository;

  const LoginIOSUseCase({
    required final AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<TokenModel> call(
      final LoginIOSParams params,
      ) async =>
      await _authRepository.loginWithIOS(fcmToken: params.fcmToken);
}

class LoginIOSParams{
  LoginIOSParams({
    required this.fcmToken
  });

  final String fcmToken;
}