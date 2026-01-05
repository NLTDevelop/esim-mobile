
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends Equatable {
  const TokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpirationAt,
    required this.refreshTokenExpirationAt,
  });

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'access_token_expires_at')
  final String accessTokenExpirationAt;
  @JsonKey(name: 'refresh_token_expires_at')
  final String refreshTokenExpirationAt;

  @override
  List<Object?> get props => [accessToken, refreshToken, accessTokenExpirationAt, refreshTokenExpirationAt];

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}
