part of 'checkout_bloc.dart';


@freezed
class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  @override
  TariffModel get tariff => when(
    loading: (tariff,__, ___) => tariff,
    success: (tariff, __, ___) => tariff,
    failure: (tariff, __, ___, ____) => tariff,
  );

  @override
  bool get isOpenPromoCode => when(
    loading: (_,isOpenPromoCode, __) => isOpenPromoCode,
    success: (_, isOpenPromoCode, __) => isOpenPromoCode,
    failure: (__, isOpenPromoCode, ___, ____) => isOpenPromoCode,
  );

  @override
  PromoCode? get promoCode => when(
    loading: (_,__, promoCode) => promoCode,
    success: (_, __, promoCode) => promoCode,
    failure: (__, ___, promoCode, ____) => promoCode,
  );


  const factory CheckoutState.success({
    required final TariffModel tariff,
    required final bool isOpenPromoCode,
    final PromoCode? promoCode
  }) = _Success;

  const factory CheckoutState.loading({
    required final TariffModel tariff,
    @Default(false) final bool isOpenPromoCode,
    @Default(null) final PromoCode? promoCode
  }) = _Loading;

  const factory CheckoutState.failure({
    required final TariffModel tariff,
    @Default(false) final bool isOpenPromoCode,
    @Default(null) PromoCode? promoCode,
    String? message
  }) = _Failure;

}
