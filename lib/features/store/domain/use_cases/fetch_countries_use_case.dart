import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/domain/repository/countries_repository.dart';

class FetchCountriesUseCase extends UseCase<List<CountryModel>, NoParams> {
  final CountriesRepository _countriesRepository;

  const FetchCountriesUseCase({
    required final CountriesRepository countriesRepository,
  }) : _countriesRepository = countriesRepository;

  @override
  Future<List<CountryModel>> call(
      final NoParams params,
      ) async {
    return await _countriesRepository.fetchCountries();
  }
}

