

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promocode.g.dart';

@JsonSerializable()
class PromoCode extends Equatable{
  const PromoCode({
    required this.title,
    required this.discountPercents,
});

  final String title;
  final int discountPercents;

  @override
  List<Object?> get props => [title, discountPercents];

  factory PromoCode.fromJson(Map<String, dynamic> json) => _$PromoCodeFromJson(json);
}