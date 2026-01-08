

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deposit_url_model.g.dart';

@JsonSerializable()
class DepositUrlModel extends Equatable{
  const DepositUrlModel({
    required this.url,
    required this.message,
    required this.status,
    required this.trx,
  });

  final String url;
  final String message;
  final int status;
  final String trx;

  @override
  List<Object?> get props => [url, message, status, trx];

  factory DepositUrlModel.fromJson(Map<String, dynamic> json) => _$DepositUrlModelFromJson(json);
  Map<String, dynamic> toJson() => _$DepositUrlModelToJson(this);
}