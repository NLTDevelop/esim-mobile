
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coverage_model.g.dart';

@JsonSerializable()
class CoverageModel extends Equatable{
  const CoverageModel({
    required this.name,
  });

  final String name;

  factory CoverageModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageModelFromJson(json);

  @override
  List<Object?> get props => [name];

}