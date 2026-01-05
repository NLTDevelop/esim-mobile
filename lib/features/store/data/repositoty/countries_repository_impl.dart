
import 'package:esim_mob_app/features/store/data/data_sources/remote/countries_remote_data_source.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
import 'package:esim_mob_app/features/store/domain/repository/countries_repository.dart';

class CountryRepositoryImpl implements CountriesRepository {
  final CountriesRemoteDataSource _countriesRemoteDataSource;

  const CountryRepositoryImpl({
    required final CountriesRemoteDataSource countriesRemoteDataSource,
  }) : _countriesRemoteDataSource = countriesRemoteDataSource;


  @override
  Future<List<CountryModel>> fetchCountries() async {
    return await _countriesRemoteDataSource.fetchCountries();
  }

  @override
  Future<List<RegionModel>> fetchRegions() async {
    return await _countriesRemoteDataSource.fetchRegions();
  }

}