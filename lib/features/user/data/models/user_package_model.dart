
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_package_model.g.dart';

@JsonSerializable()
class UserPackageModel extends Equatable{
  const UserPackageModel({
    required this.packageId,
    required this.bundleTitle,
    required this.bundleSlug,
    required this.validDays,
    required this.dataInMB,
    required this.price,
    required this.currency,
    required this.selected
  });

  @JsonKey(name: 'package_id')
  final String packageId;
  @JsonKey(name: 'bundle_title')
  final String bundleTitle;
  @JsonKey(name: 'bundle_slug')
  final String? bundleSlug;
  @JsonKey(name: 'data_mb')
  final int dataInMB;
  @JsonKey(name: 'valid_days')
  final int? validDays;
  final double price;
  final String currency;
  final bool selected;

  @override
  List<Object?> get props => [packageId, bundleTitle, bundleSlug, dataInMB, validDays, price, currency, selected];

  factory UserPackageModel.fromJson(Map<String, dynamic> json) => _$UserPackageModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserPackageModelToJson(this);
}