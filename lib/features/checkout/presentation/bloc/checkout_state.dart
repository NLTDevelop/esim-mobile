part of 'checkout_bloc.dart';


@freezed
class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  @override
  bool get isOpenPromoCode => when(
    initial: (isOpenPromoCode) => isOpenPromoCode,
    loading: (isOpenPromoCode) => isOpenPromoCode,
    success: (isOpenPromoCode) => isOpenPromoCode,
    failure: (isOpenPromoCode, __,) => isOpenPromoCode
  );


  const factory CheckoutState.initial({
    @Default(false) bool isOpenPromoCode
  }) = Inital;

  const factory CheckoutState.success({
    required final bool isOpenPromoCode,
  }) = _Success;

  const factory CheckoutState.loading({
    @Default(false) final bool isOpenPromoCode,
  }) = _Loading;

  const factory CheckoutState.failure({
    @Default(false) final bool isOpenPromoCode,
    String? message
  }) = _Failure;

}
