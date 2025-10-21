

part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const PaymentState._();


  const factory PaymentState.initial({
    required double price,
    required String currency
}) = _Initial;

  const factory PaymentState.loading({
    required double price,
    required String currency
  }) = _Loading;

  const factory PaymentState.success({
    required double price,
    required String currency
  }) = _Success;

  const factory PaymentState.failure({
    required double price,
    required String currency
  }) = _Failure;
}
