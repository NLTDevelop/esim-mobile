
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class PriceModel extends Equatable {
  const PriceModel({
    required this.amount,
    required this.currency
  });

  final num amount;
  final String currency;

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);

  @override
  List<Object?> get props => [amount, currency];
}