
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends Equatable {
  const TokenModel({
    required this.accessToken,
  });

  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  List<Object?> get props => [accessToken];

  factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
}
