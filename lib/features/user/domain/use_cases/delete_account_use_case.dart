

import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class DeleteAccountUseCase extends UseCase<void, NoParams> {
  final UserRepository userRepository;

  const DeleteAccountUseCase({
    required this.userRepository,
  });

  @override
  Future<void> call(
      final NoParams params,
      ) async =>
      await userRepository.deleteUserAccount(
      );
}