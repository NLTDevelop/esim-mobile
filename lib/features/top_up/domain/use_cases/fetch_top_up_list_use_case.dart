


import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/top_up/domain/respository/top_up_repository.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';

class FetchTopUpListUseCase extends UseCase<List<UserPackageModel>, int> {
  final TopUpRepository _topUpRepository;

  const FetchTopUpListUseCase({
    required final TopUpRepository topUpRepository,
  }) : _topUpRepository = topUpRepository;

  @override
  Future<List<UserPackageModel>> call(
      final int id,
      ) async => await _topUpRepository.fetchAutoTopUpActivations(id: id);
}



