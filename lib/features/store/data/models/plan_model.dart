import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.g.dart';

@JsonSerializable()
class PlanModel extends Equatable{
  const PlanModel({
    required this.id,
    required this.title,
    required this.isLocal,
    required this.price,
    required this.tariffs,
    this.iconPath,
  });

  final int id;
  final String title;
  final bool isLocal;
  final double price;
  final String? iconPath;
  final List<TariffModel> tariffs;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  @override
  List<Object?> get props => [id, title, isLocal, price, iconPath, tariffs];

}