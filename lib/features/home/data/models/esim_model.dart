
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'esim_model.g.dart';

@JsonSerializable()
class ESimModel extends Equatable{
  const ESimModel({
    required this.name,
    required this.dataInGB,
    required this.days,
    required this.createdAt,
    required this.iconPath,
    this.isActive = false
  });

  final String name;
  final String iconPath;
  @JsonKey(name: 'data_in_gb')
  final int dataInGB;
  final int days;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  List<Object?> get props => [name, dataInGB, days, isActive, createdAt, iconPath];

  factory ESimModel.fromJson(Map<String, dynamic> json) => _$ESimModelFromJson(json);
}