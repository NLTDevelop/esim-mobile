import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel extends Equatable{
  const PlanModel({
    required this.id,
    required this.title,
    required this.isLocal,
    required this.price,
    this.iconPath,
  });

  final int id;
  final String title;
  final bool isLocal;
  final double price;
  final String? iconPath;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  @override
  List<Object?> get props => [id, title, isLocal, price, iconPath];

}