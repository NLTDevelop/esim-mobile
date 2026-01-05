

import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';

abstract interface class CountriesRepository {
  Future<List<CountryModel>> fetchCountries();

  Future<List<RegionModel>> fetchRegions();
}
