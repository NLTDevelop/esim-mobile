import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/checkout/data/model/promocode.dart';
import 'package:esim_mob_app/features/checkout/domain/use_cases/check_promo_code_use_case.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc(
      {required CheckPromoCodeUseCase checkPromoCodeUseCase,
      required TariffModel tariff})
      : _checkPromoCodeUseCase = checkPromoCodeUseCase,
        super(CheckoutState.success(tariff: tariff, isOpenPromoCode: false)) {
    on<CheckoutEvent>((event, emit) async {
      await event.map(
          fetchTariff: (e) => _onFetchTariffData(e, emit),
          promoCodeTap: (e) => _onPromoCodeButtonTap(e, emit),
          fetchPromoCode: (e) => _onCheckPromoCode(e, emit),
          deletePromoCode: (e) => _onDeletePromoCode(e, emit)
      );
    });
  }

  final TextEditingController promoCodeTextEditingController =
      TextEditingController();
  final CheckPromoCodeUseCase _checkPromoCodeUseCase;

  String _promoCode = '';

  String get promoCode => _promoCode;

  double get discount {
    return double.parse((state.tariff.price *
            ((state.promoCode?.discountPercents ?? 0) / 100))
        .toStringAsFixed(4));
  }

  void onCheckPromoCode() {
    add(CheckoutEvent.fetchPromoCode());
  }

  Future<void> _onCheckPromoCode(
      _CheckoutEventFetchPromoCode event, Emitter<CheckoutState> emit) async {
    String? message;
    try {
      PromoCode _promoCodeEntity = await _checkPromoCodeUseCase
          .call(PromoCodeParams(promoCode: promoCodeTextEditingController.text));
      emit(CheckoutState.success(
          tariff: state.tariff,
          isOpenPromoCode: false,
          promoCode: _promoCodeEntity));
    } on Object catch (error) {
      print(error);
      message = ErrorMapper.mapError(error);
      emit(CheckoutState.failure(message: message, tariff: state.tariff));
    }
  }

  _onPromoCodeButtonTap(
      _CheckoutEventPromoCodeTap event, Emitter<CheckoutState> emit) {
    emit(CheckoutState.success(
        tariff: state.tariff, isOpenPromoCode: !state.isOpenPromoCode));
    promoCodeTextEditingController.clear();
  }

  _onDeletePromoCode(_CheckoutDeletePromoCode event, Emitter<CheckoutState> emit) {
    emit(CheckoutState.success(tariff: state.tariff, isOpenPromoCode: state.isOpenPromoCode, promoCode: null));
  }

  _onFetchTariffData(
      _CheckoutEventFetchTariff event, Emitter<CheckoutState> emit) {}

  void promoCodeButtonTap() {
    add(const _CheckoutEventPromoCodeTap());
  }

  void deletePromoCode(){
    add(const CheckoutEvent.deletePromoCode());
  }
}
