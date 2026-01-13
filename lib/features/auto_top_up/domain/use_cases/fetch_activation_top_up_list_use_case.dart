
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/repositories/auto_top_up_repository.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';

class FetchActivationTopupListUseCase extends UseCase<List<UserPackageModel>, int> {
  final AutoTopUpRepository _autoTopUpRepository;

  const FetchActivationTopupListUseCase({
    required final AutoTopUpRepository autoTopUpRepository,
  }) : _autoTopUpRepository = autoTopUpRepository;

  @override
  Future<List<UserPackageModel>> call(
      final int id,
      ) async => (await _autoTopUpRepository.fetchAutoTopUpActivations(id: id)).data;
}



