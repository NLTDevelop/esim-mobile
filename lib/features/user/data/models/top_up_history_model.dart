
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_up_history_model.g.dart';

@JsonSerializable()
class TopUpHistoryModel extends Equatable{
  const TopUpHistoryModel({
    required this.id,
    required this.mb,
    required this.price,
    required this.currencyCode,
    required this.promoCode,
    required this.appliedDiscountPercent,
    required this.createdAt,
    this.days
  });

  final int id;
  final int mb;
  final int? days;
  final double price;
  @JsonKey(name: 'currency_code')
  final String currencyCode;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'promocode')
  final String? promoCode;
  @JsonKey(name: 'applied_discount_percent')
  final double? appliedDiscountPercent;

  @override
  List<Object?> get props => [id, mb ,days, price, days, price, currencyCode, createdAt, promoCode];

  factory TopUpHistoryModel.fromJson(Map<String, dynamic> json) => _$TopUpHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopUpHistoryModelToJson(this);
}