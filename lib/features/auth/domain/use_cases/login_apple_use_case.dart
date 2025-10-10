import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:esim_mob_app/features/auth/domain/repository/auth_repository.dart';

class LoginAppleUseCase extends UseCase<TokenModel, LoginAndPasswordParams> {
  final AuthRepository _authRepository;

  const LoginAppleUseCase({
    required final AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<TokenModel> call(
      final LoginAndPasswordParams params,
      ) async =>
      await _authRepository.loginWithApple(
        email: params.email,
        password: params.password,
      );
}

class LoginAndPasswordParams {
  final String email;
  final String password;

  const LoginAndPasswordParams({
    required this.email,
    required this.password,
  });
}
