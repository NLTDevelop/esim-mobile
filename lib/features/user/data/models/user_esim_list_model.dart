

import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_esim_list_model.g.dart';

@JsonSerializable()
class UserESimListModel extends Equatable{
  const UserESimListModel({
    required this.data,
  });

  final List<UserESimModel> data;

  @override
  List<Object?> get props => [data];

  factory UserESimListModel.fromJson(Map<String, dynamic> json) => _$UserESimListModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserESimListModelToJson(this);
}