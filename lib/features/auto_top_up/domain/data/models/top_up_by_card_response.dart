
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_up_by_card_response.g.dart';

@JsonSerializable()
class TopUpByCardResponse extends Equatable{
  const TopUpByCardResponse({
    required this.redirectUrl,
    required this.trx,
  });

  @JsonKey(name: 'redirect_url')
  final String redirectUrl;
  final String trx;

  @override
  List<Object?> get props => [redirectUrl,trx];

  factory TopUpByCardResponse.fromJson(Map<String, dynamic> json) => _$TopUpByCardResponseFromJson(json);
}