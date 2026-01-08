
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel extends Equatable{
  const MetaModel({required this.currentPage, required this.lastPage, required this.perPage, required this.total});

  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'last_page')
  final int lastPage;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int total;

  @override
  List<Object?> get props => [currentPage, lastPage, perPage, total];

  factory MetaModel.fromJson(Map<String, dynamic> json) => _$MetaModelFromJson(json);
}