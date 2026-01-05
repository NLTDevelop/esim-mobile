

import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';

class AddBalanceState extends Equatable{
  const AddBalanceState({ required this.paymentGetawayType, required this.paymentValue});
  final PaymentGetawayType paymentGetawayType;
  final double paymentValue;

  @override
  List<Object?> get props => [paymentGetawayType];

  AddBalanceState copyWith({
    PaymentGetawayType? paymentGetawayType,
    double? paymentValue,
  }) {
    return AddBalanceState(
      paymentGetawayType: paymentGetawayType ?? this.paymentGetawayType,
      paymentValue: paymentValue ?? this.paymentValue,
    );
  }
}