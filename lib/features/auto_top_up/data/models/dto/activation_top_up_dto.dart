

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activation_top_up_dto.g.dart';

@JsonSerializable()
class ActivationTopUpDto extends Equatable{
  const ActivationTopUpDto({
    required this.packageId,
    required this.currencyCode,
    required this.enabled
  });

  @JsonKey(name: 'package_id')
  final String packageId;
  @JsonKey(name: 'currency_code')
  final String currencyCode;
  final bool enabled;

  @override
  List<Object?> get props => [packageId, currencyCode, enabled];

  factory ActivationTopUpDto.fromJson(Map<String, dynamic> json) => _$ActivationTopUpDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ActivationTopUpDtoToJson(this);
}