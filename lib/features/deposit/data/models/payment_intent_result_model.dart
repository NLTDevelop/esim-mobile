
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_intent_result_model.g.dart';

@JsonSerializable()
class PaymentIntentResultModel extends Equatable{
  const PaymentIntentResultModel({
    required this.clientSecret,
    required this.message,
    required this.status,
    required this.trx,
  });

  @JsonKey(name: 'client_secret')
  final String clientSecret;
  final String message;
  final int status;
  final String trx;

  @override
  List<Object?> get props => [clientSecret, message, status, trx];

  factory PaymentIntentResultModel.fromJson(Map<String, dynamic> json) => _$PaymentIntentResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentIntentResultModelToJson(this);
}