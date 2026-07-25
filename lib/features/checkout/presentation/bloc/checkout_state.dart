part of 'checkout_bloc.dart';


@freezed
class CheckoutState with _$CheckoutState {
  const CheckoutState._();

  @override
  bool get isOpenPromoCode => when(
    initial: (isOpenPromoCode, _, __, ___, ____) => isOpenPromoCode,
    loading: (isOpenPromoCode, _, __, ___, ____) => isOpenPromoCode,
      paymentLoading: (isOpenPromoCode, _, __, ___, ____) => isOpenPromoCode,
      paymentSuccess: (isOpenPromoCode, _, __, ___, ____) => isOpenPromoCode,
    success: (isOpenPromoCode, _, __, ___, ____) => isOpenPromoCode,
    failure: (isOpenPromoCode, _, __, ___, ____, _____) => isOpenPromoCode,
    loadingPromoCode: (isOpenPromoCode, _, __, ___, ____) => isOpenPromoCode,
  );

  @override
  double get price => when(
      initial: (_, __, ___, price , ____) => price,
      loading: (_, __, ___, price, ____) => price,
      paymentLoading: (_, __, ___, price,  ____,) => price,
      paymentSuccess: (_, __, ___, price,  ____,) => price,
      success: (_, __, ___, price,  ____,) => price,
      failure: (_, __, ___, price, ____, _____,) => price,
    loadingPromoCode: (_, __, ___, price,  ____,) => price,
  );

  @override
  String get currency => when(
      initial: (_, __ , ___, ____, currency) => currency,
      loading: (_, __, ___, ____, currency) => currency,
      paymentLoading: (_, __, ___, ____, currency) => currency,
      paymentSuccess: (_, __, ___, ____, currency) => currency,
      success: (_, __,  ___, ____, currency) => currency,
      failure: (_, __, ___, ____, currency, _____,) => currency,
    loadingPromoCode: (_, __,  ___, ____, currency) => currency,
  );

  @override
  PromoCode? get promoCode => when(
      initial: (_, __, promoCode, ___, ____,) => promoCode,
      loading: (_, __, promoCode, ___, ____,) => promoCode,
      paymentLoading: (_, __, promoCode, ___, ____) => promoCode,
      paymentSuccess: (_, __, promoCode, ___, ____) => promoCode,
      success: (_, __, promoCode, ___, ____) => promoCode,
      failure: (_, __, promoCode, ___, ____, _____,) => promoCode,
    loadingPromoCode: (_, __, promoCode, ___, ____) => promoCode,
  );

  @override
  PaymentByCardResultIntent? get paymentCardResultIntent => when(
      initial: (_, paymentCardResultIntent, __, ___, ____) => paymentCardResultIntent,
      loading: ( _,paymentCardResultIntent,  __, ___, ____) => paymentCardResultIntent,
      paymentLoading: (_,paymentCardResultIntent, __, ___, ____) => paymentCardResultIntent,
      paymentSuccess: (_, paymentCardResultIntent,  __, ___, ____) => paymentCardResultIntent,
      success: (_, paymentCardResultIntent, __, ___, ____) => paymentCardResultIntent,
      failure: (_, paymentCardResultIntent, __, ___, ____, _____) => paymentCardResultIntent,
    loadingPromoCode: (_, paymentCardResultIntent, __, ___, ____) => paymentCardResultIntent,
  );

  const factory CheckoutState.initial({
    @Default(false) bool isOpenPromoCode,
    @Default(null) PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
  }) = Inital;

  const factory CheckoutState.success({
    required final bool isOpenPromoCode,
    @Default(null) PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
  }) = _Success;

  const factory CheckoutState.loading({
    @Default(false) final bool isOpenPromoCode,
    @Default(null) PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
  }) = _Loading;

  const factory CheckoutState.paymentLoading({
    required final bool isOpenPromoCode,
    required final PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
  }) = _PaymentLoading;

  const factory CheckoutState.paymentSuccess({
    required final bool isOpenPromoCode,
    required final PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
  }) = _PaymentSuccess;

  const factory CheckoutState.failure({
    @Default(false) final bool isOpenPromoCode,
    @Default(null) final PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
    String? message
  }) = _Failure;

  const factory CheckoutState.loadingPromoCode({
    @Default(true) final bool isOpenPromoCode,
    @Default(null) final PaymentByCardResultIntent? paymentCardResultIntent,
    @Default(null) final PromoCode? promoCode,
    required final double price,
    required String currency,
  }) = _LoadingPromoCode;
}
