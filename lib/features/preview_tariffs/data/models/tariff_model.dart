
import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_model.g.dart';

@JsonSerializable()
class TariffModel extends Equatable{

  const TariffModel({ required this.price,required this.eSim, this.currency = 'USD'});
  final double price;
  final String? currency;
  final ESimModel eSim;

  @override
  List<Object?> get props => [price, eSim];

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);

  Map<String, dynamic> toJson() => _$TariffModelToJson(this);
}