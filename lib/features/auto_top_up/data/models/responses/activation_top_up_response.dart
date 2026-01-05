


import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activation_top_up_response.g.dart';

@JsonSerializable()
class ActivationTopUpResponse extends Equatable{
  const ActivationTopUpResponse({
    required this.packageId,
    required this.enabled
  });

  @JsonKey(name: 'package_id')
  final String packageId;
  final bool enabled;

  @override
  List<Object?> get props => [packageId, enabled];

  factory ActivationTopUpResponse.fromJson(Map<String, dynamic> json) => _$ActivationTopUpResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ActivationTopUpResponseToJson(this);
}