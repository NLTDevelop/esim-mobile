part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.processPayment({void Function()? onSuccess}) =
  _PaymentEventProcessPayment;

}
