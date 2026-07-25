import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';

class AddBalanceState extends Equatable {
  const AddBalanceState(
      {required this.paymentGetawayType,
      required this.paymentValue,
      required this.isLoading,
      required this.errorMessage,
        this.isFinishingPayment = false,
      this.paymentIntentClientSecret = '',
      this.trx = '',
      });

  final PaymentGetawayType paymentGetawayType;
  final double paymentValue;
  final bool isLoading;
  final String errorMessage;
  final String paymentIntentClientSecret;
  final String trx;
  final bool isFinishingPayment;

  @override
  List<Object?> get props => [paymentGetawayType, isLoading, paymentValue, errorMessage, paymentIntentClientSecret, trx];

  AddBalanceState copyWith({
    PaymentGetawayType? paymentGetawayType,
    double? paymentValue,
    bool? isLoading,
    String? errorMessage,
    String? paymentIntentClientSecret,
    String? trx,
    bool? isFinishingPayment,
  }) {
    return AddBalanceState(
      paymentGetawayType: paymentGetawayType ?? this.paymentGetawayType,
      paymentValue: paymentValue ?? this.paymentValue,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
        paymentIntentClientSecret: paymentIntentClientSecret ?? this.paymentIntentClientSecret,
      trx: trx ?? this.trx,
      isFinishingPayment: isFinishingPayment ?? this.isFinishingPayment,
    );
  }
}
