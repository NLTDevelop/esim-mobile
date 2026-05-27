import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_detail_model.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class FetchUserESimByIdUseCase extends UseCase<UserESimDetailModel, int> {
  final UserRepository _userRepository;

  const FetchUserESimByIdUseCase({
    required final UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserESimDetailModel> call(
      final int params,
      ) async {
    return await _userRepository.getESimById(id: params);
  }
}

