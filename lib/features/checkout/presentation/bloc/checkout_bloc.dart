import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_balance.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/purchase_esim_by_card_use_case.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(
      {required PurchaseESimByCardUseCase purchaseESimByCardUseCase,
      required PurchaseESimByBalanceUseCase purchaseESimByBalanceUseCase,
      required PackageModel tariff, required String esimLocation, required String type})
      : _purchaseESimByCardUseCase = purchaseESimByCardUseCase,
        _purchaseESimByBalanceUseCase = purchaseESimByBalanceUseCase,
        _tariff = tariff,
          location = esimLocation,
  _type = type,
        super(CheckoutState.initial( isOpenPromoCode: false)) {
    on<CheckoutEvent>((event, emit) async {
      await event.map(
          fetchTariff: (e) => _onFetchTariffData(e, emit),
          promoCodeTap: (e) => _onPromoCodeButtonTap(e, emit),
          fetchPromoCode: (e) => _onCheckPromoCode(e, emit),
          deletePromoCode: (e) => _onDeletePromoCode(e, emit), purchaseByBalance: (e) => _onPurchaseByBalance(e, emit), purchaseByCard: (e) => _onPurchaseByCard(e, emit));
    });
  }

  final TextEditingController promoCodeTextEditingController =
      TextEditingController();
  final PurchaseESimByCardUseCase _purchaseESimByCardUseCase;
  final PurchaseESimByBalanceUseCase _purchaseESimByBalanceUseCase;

  final String location;

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
    // String? message;
    // try {
    //   PromoCode _promoCodeEntity = await _checkPromoCodeUseCase.call(
    //       PromoCodeParams(promoCode: promoCodeTextEditingController.text));
    //   emit(CheckoutState.success(
    //       tariff: state.tariff,
    //       isOpenPromoCode: false,
    //       promoCode: _promoCodeEntity));
    // } on Object catch (error) {
    //   print(error);
    //   message = ErrorMapper.mapError(error);
    //   emit(CheckoutState.failure(message: message, tariff: state.tariff));
    // }
  }

  _onPromoCodeButtonTap(
      _CheckoutEventPromoCodeTap event, Emitter<CheckoutState> emit) {
    emit(CheckoutState.success(isOpenPromoCode: !state.isOpenPromoCode));
    promoCodeTextEditingController.clear();
  }

  _onDeletePromoCode(
      _CheckoutDeletePromoCode event, Emitter<CheckoutState> emit) {
    emit(CheckoutState.success(
        isOpenPromoCode: state.isOpenPromoCode,));
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
      emit(const CheckoutState.loading());
      final purchaseResult = await _purchaseESimByBalanceUseCase.call(PurchaseESimParams(type: _type, location: location, package: _tariff.packageId.toString(), promoCode: promoCode));
      emit(const CheckoutState.success(isOpenPromoCode: false));
    } on Object catch(e){
      String message = ErrorMapper.mapError(e);
      emit(CheckoutState.failure(message: message));
    }
  }
  
  _onPurchaseByCard(_PurchaseByCard event, Emitter<CheckoutState> emit){
    try{
      
    } on Object catch(e){
      
    }
  }
}
