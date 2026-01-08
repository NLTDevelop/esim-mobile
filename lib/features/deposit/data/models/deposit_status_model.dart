

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deposit_status_model.g.dart';

@JsonSerializable()
class DepositStatusModel extends Equatable{
  const DepositStatusModel({
    required this.message,
    required this.status,
    required this.trx,
  });

  final String message;
  final int status;
  final String trx;

  @override
  List<Object?> get props => [message, status, trx];

  factory DepositStatusModel.fromJson(Map<String, dynamic> json) => _$DepositStatusModelFromJson(json);
  Map<String, dynamic> toJson() => _$DepositStatusModelToJson(this);
}