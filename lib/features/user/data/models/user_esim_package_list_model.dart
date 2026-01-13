

import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_esim_package_list_model.g.dart';

@JsonSerializable()
class UserESimPackageListModel extends Equatable{
  const UserESimPackageListModel({
    required this.data,
  });

  final List<UserPackageModel> data;

  @override
  List<Object?> get props => [data];

  factory UserESimPackageListModel.fromJson(Map<String, dynamic> json) => _$UserESimPackageListModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserESimPackageListModelToJson(this);
}