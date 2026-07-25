
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_by_card_result_intent.g.dart';

@JsonSerializable()
class PaymentByCardResultIntent extends Equatable{
  const PaymentByCardResultIntent({
    required this.clientSecret,
    required this.trx,
  });

  @JsonKey(name: 'client_secret')
  final String clientSecret;
  final String trx;

  @override
  List<Object?> get props => [clientSecret,trx];

  factory PaymentByCardResultIntent.fromJson(Map<String, dynamic> json) => _$PaymentByCardResultIntentFromJson(json);
}