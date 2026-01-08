

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_request_response.g.dart';

@JsonSerializable()
class DeleteRequestResponse extends Equatable{
  const DeleteRequestResponse({
    required this.message,
    required this.secondsLeft,
  });

  final String message;

  @JsonKey(name: 'seconds_left')
  final int secondsLeft;

  @override
  List<Object?> get props => [secondsLeft, message];

  factory DeleteRequestResponse.fromJson(Map<String, dynamic> json) => _$DeleteRequestResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteRequestResponseToJson(this);
}