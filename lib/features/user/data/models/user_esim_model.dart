
import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/user/data/models/top_up_history_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_esim_model.g.dart';

@JsonSerializable()
class UserESimModel extends Equatable{
  const UserESimModel({
    required this.id,
    required this.mb,
    required this.days,
    required this.price,
    required this.currencyCode,
    required this.canAutoTopUp,
    required this.canTopUp,
    required this.createdAt,
    required this.topUpHistory,
    this.promoCode,
    this.appliedDiscountPercent,
  });

  final int id;
  final int mb;
  final int? days;
  final double price;
  @JsonKey(name: 'currency_code')
  final String? currencyCode;
  @JsonKey(name: 'can_topup')
  final bool canTopUp;
  @JsonKey(name: 'can_auto_topup')
  final bool canAutoTopUp;
  final DateTime createdAt;
  final String? promoCode;
  final double? appliedDiscountPercent;
  @JsonKey(name: 'topup_history')
  final List<TopUpHistoryModel> topUpHistory;

  @override
  List<Object?> get props => [id, mb, days, price, currencyCode, canTopUp, canAutoTopUp, createdAt, promoCode, appliedDiscountPercent, topUpHistory];

  factory UserESimModel.fromJson(Map<String, dynamic> json) => _$UserESimModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserESimModelToJson(this);
}