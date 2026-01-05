

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto extends Equatable{
  const MessageDto({required this.message});
  final String message;

  @override
  List<Object?> get props => [ message ];

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}