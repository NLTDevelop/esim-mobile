

import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class ConfirmDeletionAccountUseCase extends UseCase<void, String>{

  ConfirmDeletionAccountUseCase({required UserRepository userRepository}) : _userRepository = userRepository, super();

  final UserRepository _userRepository;
  @override
  Future<void> call(String code) async => await _userRepository.sendCodeForDeleteAccount(code: code);


}