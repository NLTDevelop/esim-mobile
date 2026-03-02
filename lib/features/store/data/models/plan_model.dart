import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/store/data/models/coverage_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel extends Equatable{
  const PlanModel({
    required this.title,
    required this.slug,
    required this.packages,
    required this.coverages,
    required this.image,
    required this.privacyIPLocation,
    this.iconPath,
  });

  final String slug;
  final String title;
  final String? iconPath;
  final String? image;
  @JsonKey(name: 'privacy_ip_location')
  final String? privacyIPLocation;
  final List<PackageModel> packages;
  final List<CoverageModel> coverages;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  @override
  List<Object?> get props => [slug, title, iconPath, packages, image, coverages, privacyIPLocation];

}