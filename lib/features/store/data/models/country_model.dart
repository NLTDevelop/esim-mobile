
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:esim_mob_app/features/store/data/models/price_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends BaseCountry{
  const CountryModel({
    required super.name,
    required this.code,
    required this.prices,
  });

  final String code;
  final List<PriceModel> prices;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  @override
  List<Object?> get props => [name, code, prices];

}