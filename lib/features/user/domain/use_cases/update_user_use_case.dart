
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auth/data/models/user_model.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class UpdateUserUseCase extends UseCase<UserModel, String> {
  final UserRepository _userRepository;

  const UpdateUserUseCase({
    required final UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> call(String params) async => await _userRepository.updateUser(currencyCode: params);
}
