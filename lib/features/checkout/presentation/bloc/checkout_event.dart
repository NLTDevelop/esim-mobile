

part of 'checkout_bloc.dart';


@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.fetchTariff() =
  _CheckoutEventFetchTariff;

  const factory CheckoutEvent.promoCodeTap() = _CheckoutEventPromoCodeTap;

  const factory CheckoutEvent.fetchPromoCode() = _CheckoutEventFetchPromoCode;

  const factory CheckoutEvent.deletePromoCode() = _CheckoutDeletePromoCode;

  const factory CheckoutEvent.purchaseByBalance() = _PurchaseByBalance;

  const factory CheckoutEvent.purchaseByCard() = _PurchaseByCard;

  const factory CheckoutEvent.onChangeCurrency({ required final String currency }) = _CheckoutEventChangeCurrency;
}
