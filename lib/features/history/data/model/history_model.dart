


import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/history/data/model/meta_model.dart';
import 'package:esim_mob_app/features/history/data/model/transaction_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history_model.g.dart';

@JsonSerializable()
class HistoryModel extends Equatable {
  const HistoryModel({required this.transactions, required this.meta});

  @JsonKey(name: 'data')
  final List<TransactionModel> transactions;
  final MetaModel meta;

  @override
  List<Object?> get props => [transactions, meta];

  factory HistoryModel.fromJson(Map<String, dynamic> json) => _$HistoryModelFromJson(json);
}