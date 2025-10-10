
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_model.g.dart';

@JsonSerializable()
class TariffModel extends Equatable{

  const TariffModel({required this.dataInGB, required this.price, required this.durationInDays});
  final int dataInGB;
  final int durationInDays;
  final double price;

  @override
  List<Object?> get props => [dataInGB, durationInDays, price];

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);
}