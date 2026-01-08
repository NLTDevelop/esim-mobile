
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/user/data/models/delete_request_response.dart';
import 'package:esim_mob_app/features/user/domain/repository/user_repository.dart';

class DeleteAccountUseCase extends UseCase<DeleteRequestResponse, NoParams>{

  DeleteAccountUseCase({required UserRepository userRepository}) : _userRepository = userRepository, super();

  final UserRepository _userRepository;
  @override
  Future<DeleteRequestResponse> call(NoParams params) async => await _userRepository.deleteUserAccount();


}