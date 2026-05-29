
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchased_esim_by_balance_response.g.dart';

@JsonSerializable()
class PurchasedESimByBalanceResponse extends Equatable{
  const PurchasedESimByBalanceResponse({
    required this.id,
    required this.paymentSuccess,
  });

  @JsonKey(name: 'activation_id')
  final num id;
  @JsonKey(name: 'payment_success')
  final bool paymentSuccess;

  @override
  List<Object?> get props => [id,paymentSuccess];

  factory PurchasedESimByBalanceResponse.fromJson(Map<String, dynamic> json) => _$PurchasedESimByBalanceResponseFromJson(json);
}