part of 'checkout_bloc.dart';


@freezed
class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  @override
  bool get isOpenPromoCode => when(
    initial: (isOpenPromoCode, _, __) => isOpenPromoCode,
    loading: (isOpenPromoCode, _, __) => isOpenPromoCode,
    success: (isOpenPromoCode, _, __) => isOpenPromoCode,
    failure: (isOpenPromoCode, _, __, ___,) => isOpenPromoCode
  );

  @override
  double get price => when(
      initial: (_, price , __) => price,
      loading: (_, price, __) => price,
      success: (_, price, __) => price,
      failure: (_, price, __, ___,) => price
  );

  @override
  String get currency => when(
      initial: (_, __ , currency) => currency,
      loading: (_, __, currency) => currency,
      success: (_, __, currency) => currency,
      failure: (_, __, currency, ___,) => currency
  );


  const factory CheckoutState.initial({
    @Default(false) bool isOpenPromoCode,
    required final double price,
    required String currency,
  }) = Inital;

  const factory CheckoutState.success({
    required final bool isOpenPromoCode,
    required final double price,
    required String currency,
  }) = _Success;

  const factory CheckoutState.loading({
    @Default(false) final bool isOpenPromoCode,
    required final double price,
    required String currency,
  }) = _Loading;

  const factory CheckoutState.failure({
    @Default(false) final bool isOpenPromoCode,
    required final double price,
    required String currency,
    String? message
  }) = _Failure;

}
