import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/notifcations/domain/repository/token_repository.dart';

class TokenLogoutUseCase extends UseCase<void, NoParams> {
  const TokenLogoutUseCase({
    required final TokenRepository tokenRepository,
  }) : _tokenRepository = tokenRepository;
  final TokenRepository _tokenRepository;

  @override
  Future<void> call(NoParams params) async => await _tokenRepository.onLogoutUser();
}
