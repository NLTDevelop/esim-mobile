
import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_model.g.dart';

@JsonSerializable()
class TariffModel extends Equatable{

  const TariffModel({required this.dataInGB, required this.price, required this.durationInDays, required this.eSim});
  final int dataInGB;
  final int durationInDays;
  final double price;
  final ESimModel eSim;

  @override
  List<Object?> get props => [dataInGB, durationInDays, price, eSim];

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);
}