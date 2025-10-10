import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auth/data/models/token_model.dart';
import 'package:esim_mob_app/features/auth/domain/repository/auth_repository.dart';

class LoginGoogleUseCase extends UseCase<TokenModel, LoginAndPasswordParamsGoogle> {
  final AuthRepository _authRepository;

  const LoginGoogleUseCase({
    required final AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<TokenModel> call(
      final LoginAndPasswordParamsGoogle params,
      ) async =>
      await _authRepository.loginWithGoogle(
        email: params.email,
        password: params.password,
      );
}

class LoginAndPasswordParamsGoogle {
  final String email;
  final String password;

  const LoginAndPasswordParamsGoogle({
    required this.email,
    required this.password,
  });
}
