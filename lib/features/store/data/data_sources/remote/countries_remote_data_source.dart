

import 'package:dio/dio.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
import 'package:esim_mob_app/core/client/rest/awinst_rest_api.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'countries_remote_data_source.g.dart';

@RestApi(baseUrl: AwinstApi.baseUrl)
abstract class CountriesRemoteDataSource {
  factory CountriesRemoteDataSource(Dio dio, {String? baseUrl}) = _CountriesRemoteDataSource;
  @GET('v1/country')
  Future<List<CountryModel>> fetchCountries();

  @GET('v1/region')
  Future<List<RegionModel>> fetchRegions();


}