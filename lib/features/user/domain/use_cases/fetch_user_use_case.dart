
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class FetchCurrentUserUseCase extends UseCase<UserModel, NoParams> {
  final UserRepository _userRepository;

  const FetchCurrentUserUseCase({
    required final UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> call(params) async => await _userRepository.getCurrentUser();
}
