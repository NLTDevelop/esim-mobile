
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class DeleteAccountUseCase extends UseCase<void, NoParams>{

  DeleteAccountUseCase({required UserRepository userRepository}) : _userRepository = userRepository, super();

  final UserRepository _userRepository;
  @override
  Future<void> call(NoParams params) async => await _userRepository.deleteUserAccount();


}