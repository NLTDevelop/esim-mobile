

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  const TransactionModel({required this.id, required this.trx, required this.amount, required this.charge,required this.discountAmount, required this.gatewayName, required this.currencyCode, required this.status, required this.createdAt});

  final num id;
  final String trx;
  final String amount;
  final String charge;
  @JsonKey(name: 'discount_amount')
  final String discountAmount;
  @JsonKey(name: 'gateway_name')
  final String gatewayName;
  @JsonKey(name: 'currency_code')
  final String currencyCode;
  final int status;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  List<Object?> get props => [id, trx, amount, charge, discountAmount, gatewayName, currencyCode, status, createdAt];
  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}