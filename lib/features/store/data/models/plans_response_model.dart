import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plans_response_model.g.dart';

@JsonSerializable()
class PlansResponseModel extends Equatable{
  const PlansResponseModel({
    required this.data,
  });

  final List<PlanModel> data;

  factory PlansResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlansResponseModelFromJson(json);

  @override
  List<Object?> get props => [data];

}