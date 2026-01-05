import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
import 'package:esim_mob_app/features/store/domain/repository/countries_repository.dart';

class FetchRegionsUseCase extends UseCase<List<RegionModel>, NoParams> {
  final CountriesRepository _countriesRepository;

  const FetchRegionsUseCase({
    required final CountriesRepository countriesRepository,
  }) : _countriesRepository = countriesRepository;

  @override
  Future<List<RegionModel>> call(
      final NoParams params,
      ) async {
    return await _countriesRepository.fetchRegions();
  }
}

