

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_up_by_balance_response.g.dart';

@JsonSerializable()
class TopUpByBalanceResponse extends Equatable{
  const TopUpByBalanceResponse({
    required this.activationId,
    required this.paymentSuccess,
  });

  @JsonKey(name: 'activation_id')
  final int activationId;
  @JsonKey(name: 'payment_success')
  final bool paymentSuccess;

  @override
  List<Object?> get props => [activationId,paymentSuccess];

  factory TopUpByBalanceResponse.fromJson(Map<String, dynamic> json) => _$TopUpByBalanceResponseFromJson(json);
}