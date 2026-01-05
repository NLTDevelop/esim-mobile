
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  const TransactionModel({required this.tariff, required this.createdAt, required this.price, required this.currency, this.promoCode});

  final PackageModel tariff;
  final double price;
  final String currency;
  final DateTime createdAt;
  final PromoCode? promoCode;

  @override
  List<Object?> get props => [tariff, price, currency, createdAt, promoCode];
}