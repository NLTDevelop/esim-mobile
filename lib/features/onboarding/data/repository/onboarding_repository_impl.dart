

import 'package:esim_mob_app/features/onboarding/data/data_sources/local/first_start_app_storage.dart';
import 'package:esim_mob_app/features/onboarding/domain/repository/onboarding_repository.dart';

final class OnBoardingRepositoryImpl implements OnBoardingRepository {
  const OnBoardingRepositoryImpl({
    required FirstStartAppStorage firstStartAppStorage,
  }) : _firstStartAppStorage = firstStartAppStorage;

  final FirstStartAppStorage _firstStartAppStorage;

  @override
  bool isFirstRun()  {
    return  _firstStartAppStorage.load();
  }

  @override
  Future<void> setFirstRun(bool isFirstRun) async {
    await _firstStartAppStorage.save(isFirstRun);
  }

  @override
  Future<void> clearFirstRun() async {
    await _firstStartAppStorage.clear();
  }
}
