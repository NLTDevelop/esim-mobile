
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/dto/activation_top_up_dto.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/repositories/auto_top_up_repository.dart';

class UpdateActivationTopUpUseCase extends UseCase<bool, UpdateActivationParams> {
  final AutoTopUpRepository _autoTopUpRepository;

  const UpdateActivationTopUpUseCase({
    required final AutoTopUpRepository autoTopUpRepository,
  }) : _autoTopUpRepository = autoTopUpRepository;

  @override
  Future<bool> call(
      UpdateActivationParams params
      ) async => (await _autoTopUpRepository.updateActivationTopUp(id: params.id, activationTopUpDto: params.dto)).enabled;
}


class UpdateActivationParams{
  const UpdateActivationParams({
    required this.id,
    required this.dto,
});

  final int id;
  final ActivationTopUpDto dto;
}