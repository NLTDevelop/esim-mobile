
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'region_model.g.dart';

@JsonSerializable()
class RegionModel extends BaseCountry{
  const RegionModel({
    required this.id,
    required super.name,
  });

  final int id;

  factory RegionModel.fromJson(Map<String, dynamic> json) =>
      _$RegionModelFromJson(json);

  @override
  List<Object?> get props => [name, id];

}