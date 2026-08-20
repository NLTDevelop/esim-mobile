import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/checkout/data/model/payment_by_card_result_intent.dart';
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/check_promo_code_use_case.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_balance.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_card_use_case.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_local_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regional_esims_use_case.dart';
import 'package:esim_mob_app/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(
      {required PurchaseESimByCardUseCase purchaseESimByCardUseCase,
      required PurchaseESimByBalanceUseCase purchaseESimByBalanceUseCase,
        required CheckPromoCodeUseCase checkPromoCodeUseCase,
      required PackageModel tariff,
        required String esimLocation,
        required String type,
        required num? regionId
      }) :
        _purchaseESimByBalanceUseCase = purchaseESimByBalanceUseCase,
        _checkPromoCodeUseCase = checkPromoCodeUseCase,
        _tariff = tariff,
          location = esimLocation,
          _type = type,
        _regionId = regionId,
        super(CheckoutState.initial( isOpenPromoCode: false, currency: tariff.currency, price: tariff.price)) {
    on<CheckoutEvent>((event, emit) async {
      await event.map(
          fetchTariff: (e) => _onFetchTariffData(e, emit),
          promoCodeTap: (e) => _onPromoCodeButtonTap(e, emit),
          fetchPromoCode: (e) => _onCheckPromoCode(e, emit),
          deletePromoCode: (e) => _onDeletePromoCode(e, emit),
          purchaseByBalance: (e) => _onPurchaseByBalance(e, emit),
          purchaseByCard: (e) => _onPurchaseByCard(e, emit),
          onChangeCurrency: (e) => _onChangeCurrency(e, emit)
      );
    });
  }

  final TextEditingController promoCodeTextEditingController =
      TextEditingController();

  final PurchaseESimByBalanceUseCase _purchaseESimByBalanceUseCase;
  final CheckPromoCodeUseCase _checkPromoCodeUseCase;

  final String location;

  final num? _regionId;
  final PackageModel _tariff;
  PackageModel get tariff => _tariff;

  final String _type;
  String get type => _type;

  String _promoCode = '';

  String get promoCode => _promoCode;

  // double get discount {
  //   return double.parse(
  //       (state.tariff.price * ((state.promoCode?.discountPercents ?? 0) / 100))
  //           .toStringAsFixed(4));
  // }

  void onCheckPromoCode() {
    add(CheckoutEvent.fetchPromoCode());
  }

  Future<void> _onCheckPromoCode(
      _CheckoutEventFetchPromoCode event, Emitter<CheckoutState> emit) async {
    String? message;
    try {
      emit(CheckoutState.loadingPromoCode(price: state.price, currency: state.currency));
      PromoCode _promoCodeEntity = await _checkPromoCodeUseCase.call(
          PromoCodeParams(promoCode: promoCodeTextEditingController.text));
     emit(CheckoutState.initial(price: state.price, currency: state.currency, isOpenPromoCode: true, promoCode: _promoCodeEntity));
    } on Object catch (error) {
      message = ErrorMapper.mapError(error);
      emit(CheckoutState.failure(message: message == 'Bad Request' ? 'Invalid promocode' : message, price: state.price, currency: state.currency));
    }
  }

  _onPromoCodeButtonTap(
      _CheckoutEventPromoCodeTap event, Emitter<CheckoutState> emit) {
    emit(CheckoutState.initial(isOpenPromoCode: !state.isOpenPromoCode, currency: state.currency, price: state.price));
    promoCodeTextEditingController.clear();
  }

  _onDeletePromoCode(
      _CheckoutDeletePromoCode event, Emitter<CheckoutState> emit) {
    promoCodeTextEditingController.clear();
    emit(CheckoutState.initial(
        isOpenPromoCode: false, currency: state.currency, price: state.price, promoCode: null));
  }

  _onFetchTariffData(
      _CheckoutEventFetchTariff event, Emitter<CheckoutState> emit) {}

  void promoCodeButtonTap() {
    add(const _CheckoutEventPromoCodeTap());
  }

  void deletePromoCode() {
    add(const CheckoutEvent.deletePromoCode());
  }

  _onPurchaseByBalance(_PurchaseByBalance event, Emitter<CheckoutState> emit) async{
    try{
      emit(CheckoutState.loading(currency: state.currency, price: state.price));
      await _purchaseESimByBalanceUseCase.call(PurchaseESimParams(type: _type, location: location, package: _tariff.packageId.toString(), promoCode: promoCode.isEmpty ? null : promoCode));
      emit(CheckoutState.success(isOpenPromoCode: false, currency: state.currency, price: state.price));
    } on Object catch(e){
      String message = ErrorMapper.mapError(e);
      emit(CheckoutState.failure(message: message, currency: state.currency, price: state.price));
    }
  }
  
  _onPurchaseByCard(_PurchaseByCard event, Emitter<CheckoutState> emit) async{
    emit(CheckoutState.paymentLoading(isOpenPromoCode: false, currency: state.currency, price: state.price, paymentCardResultIntent: event.paymentIntent));
    try{
      PaymentByCardResultIntent purchaseResult = await injector<PurchaseESimByCardUseCase>().call(PurchaseESimParams(type: type, location: location, package: tariff.packageId, promoCode: promoCodeTextEditingController.text));
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: purchaseResult.clientSecret,
          merchantDisplayName: "My Store",
        ),
      );

      // Step 3: Show Payment Sheet
      await Stripe.instance.presentPaymentSheet();
      emit(CheckoutState.paymentSuccess(isOpenPromoCode: state.isOpenPromoCode, paymentCardResultIntent: purchaseResult, price: state.price, currency: state.currency));
    } on Object catch(e) {
      String message = ErrorMapper.mapError(e);
      emit(CheckoutState.failure(message: message, currency: state.currency, price: state.price));
    }

  }

  _onChangeCurrency(_CheckoutEventChangeCurrency event, Emitter<CheckoutState> emit) async{
    try{
      emit(CheckoutState.loading(currency: state.currency, price: state.price));
      if(type == 'local'){
        List<PlanModel> plans = await injector<FetchLocalESimsUseCase>().call(FetchLocalESimsParams(currencyCode: event.currency, countryCode: location));
        _findCurrentPackage(plans, emit, event.currency);
      } else if (_regionId != null) {
        List<PlanModel> plans = await injector<FetchRegionalESimsUseCase>().call(FetchRegionalESimsParams(regionalId: _regionId.toString(), currencyCode: event.currency));
        _findCurrentPackage(plans, emit, event.currency);
      }
    } on Object catch(e){
      String message = ErrorMapper.mapError(e);
      emit(CheckoutState.failure(message: message, currency: state.currency, price: state.price));
    }
  }

  _findCurrentPackage(List<PlanModel> plans, Emitter<CheckoutState> emit, String currency){
    for(int i = 0;i < plans.length; i++){
      for(int j = 0; j < plans[i].packages.length; j++){
        if(plans[i].packages[j].packageId == tariff.packageId){
          emit(CheckoutState.initial(isOpenPromoCode: false, currency: currency, price: plans[i].packages[j].price));
        }
      }
    }
  }
}
