

import 'package:esim_mob_app/features/user/data/models/top_up_history_model.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_esim_detail_model.g.dart';

@JsonSerializable()
class UserESimDetailModel extends UserESimModel{
  UserESimDetailModel({
    required super.id,
    required super.mb,
    required super.days,
    required super.usedMb,
    required super.balanceMb,
    required super.balanceDays,
    required super.status,
    required super.price,
    required super.currencyCode,
    required super.canAutoTopUp,
    required super.autoTopUpEnabled,
    required super.autoTopUpPackage,
    required super.canTopUp,
    required super.createdAt,
    required super.topUpHistory,
    required super.country,
    required this.qrText,
    required this.iccid,

  });

  @JsonKey(name: 'qr_text')
  final String qrText;
  final String iccid;

  @override
  List<Object?> get props => [
    ...super.props,
    qrText,
    iccid
  ];

  factory UserESimDetailModel.fromJson(Map<String, dynamic> json) {
    final base = UserESimModel.fromJson(json);
    return UserESimDetailModel(
      id: base.id,
      mb: base.mb,
      days: base.days,
      usedMb: base.usedMb,
      balanceMb: base.balanceMb,
      balanceDays: base.balanceDays,
      status: base.status,
      price: base.price,
      currencyCode: base.currencyCode,
      canAutoTopUp: base.canAutoTopUp,
      autoTopUpEnabled: base.autoTopUpEnabled,
      autoTopUpPackage: base.autoTopUpPackage,
      canTopUp: base.canTopUp,
      createdAt: base.createdAt,
      topUpHistory: base.topUpHistory,
      country: base.country,
      qrText: json['qr_text'], iccid: json['iccid'],
    );
  }
}