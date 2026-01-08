import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';

class AddBalanceState extends Equatable {
  const AddBalanceState(
      {required this.paymentGetawayType,
      required this.paymentValue,
      required this.isLoading,
      required this.errorMessage,
      });

  final PaymentGetawayType paymentGetawayType;
  final double paymentValue;
  final bool isLoading;
  final String errorMessage;

  @override
  List<Object?> get props => [paymentGetawayType, isLoading, paymentValue, errorMessage];

  AddBalanceState copyWith({
    PaymentGetawayType? paymentGetawayType,
    double? paymentValue,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AddBalanceState(
      paymentGetawayType: paymentGetawayType ?? this.paymentGetawayType,
      paymentValue: paymentValue ?? this.paymentValue,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage
    );
  }
}
