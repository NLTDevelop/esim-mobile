
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchased_esim_by_card_response.g.dart';

@JsonSerializable()
class PurchasedESimByCardResponse extends Equatable{
  const PurchasedESimByCardResponse({
    required this.redirectUrl,
    required this.trx,
  });

  @JsonKey(name: 'redirect_url')
  final String redirectUrl;
  final String trx;

  @override
  List<Object?> get props => [redirectUrl,trx];

  factory PurchasedESimByCardResponse.fromJson(Map<String, dynamic> json) => _$PurchasedESimByCardResponseFromJson(json);
}