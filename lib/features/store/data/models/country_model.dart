
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends BaseCountry{
  const CountryModel({
    required super.name,
    required this.code,
  });

  final String code;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  @override
  List<Object?> get props => [name, code];

}