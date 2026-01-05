import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class FetchUserESimUseCase extends UseCase<List<UserESimModel>, NoParams> {
  final UserRepository _userRepository;

  const FetchUserESimUseCase({
    required final UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<UserESimModel>> call(
      final NoParams params,
      ) async {
    return await _userRepository.getESimList();
  }
}

