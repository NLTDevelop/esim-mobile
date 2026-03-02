import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_model.g.dart';

@JsonSerializable()
class PackageModel extends Equatable {
  const PackageModel(
      {required this.price,
        required this.currency,
        required this.packageId,
        required this.dataInMb,
        required this.validDays});

  @JsonKey(name: 'package_id')
  final String packageId;
  final double price;
  final String currency;
  @JsonKey(name: 'valid_days')
  final int? validDays;
  @JsonKey(name: 'data_mb')
  final int dataInMb;


  @override
  List<Object?> get props =>
      [price, currency, validDays, dataInMb, packageId];

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}
