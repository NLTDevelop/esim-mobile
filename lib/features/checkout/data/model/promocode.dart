

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promocode.g.dart';

@JsonSerializable()
class PromoCode extends Equatable{
  const PromoCode({
    required this.code,
    required this.discountPercent,
    required this.description,
    required this.validFrom,
    required this.validUntil
});

  final String code;
  final String? description;
  @JsonKey(name: 'discount_percent')
  final String discountPercent;
  @JsonKey(name: 'valid_from')
  final DateTime validFrom;
  @JsonKey(name: 'valid_until')
  final DateTime validUntil;

  @override
  List<Object?> get props => [code, description, discountPercent, validUntil, validFrom];

  factory PromoCode.fromJson(Map<String, dynamic> json) => _$PromoCodeFromJson(json);
}