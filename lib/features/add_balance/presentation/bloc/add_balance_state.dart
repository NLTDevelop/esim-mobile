import 'package:equatable/equatable.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';

class AddBalanceState extends Equatable {
  const AddBalanceState(
      {required this.paymentGetawayType,
      required this.paymentValue,
      required this.isLoading,
      required this.errorMessage,
      this.paymentUrl = '',
      this.trx = '',
      });

  final PaymentGetawayType paymentGetawayType;
  final double paymentValue;
  final bool isLoading;
  final String errorMessage;
  final String paymentUrl;
  final String trx;

  @override
  List<Object?> get props => [paymentGetawayType, isLoading, paymentValue, errorMessage, paymentUrl, trx];

  AddBalanceState copyWith({
    PaymentGetawayType? paymentGetawayType,
    double? paymentValue,
    bool? isLoading,
    String? errorMessage,
    String? paymentUrl,
    String? trx
  }) {
    return AddBalanceState(
      paymentGetawayType: paymentGetawayType ?? this.paymentGetawayType,
      paymentValue: paymentValue ?? this.paymentValue,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      paymentUrl: paymentUrl ?? this.paymentUrl,
      trx: trx ?? this.trx
    );
  }
}
