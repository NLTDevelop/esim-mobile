

import 'package:esim_mob_app/common/routes/routes.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';
import 'package:esim_mob_app/features/deposit/domain/use_cases/add_balance_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'add_balance_state.dart';

class AddBalanceCubit extends Cubit<AddBalanceState> {
  AddBalanceCubit({ required AddBalanceUseCase addBalanceUseCase, required String currency}) : _addBalanceUseCase = addBalanceUseCase, currencyCode = currency, super(const AddBalanceState(paymentGetawayType: PaymentGetawayType.stripe, paymentValue: 5, errorMessage: '', isLoading: false));

  final AddBalanceUseCase _addBalanceUseCase;
  final String currencyCode;

  onChangePaymentGetaway(PaymentGetawayType type){
    emit(state.copyWith(paymentGetawayType: type, errorMessage: ''));
  }
  
  onChangePaymentValue(String value){
    try{
      double? paymentValue = double.tryParse(value);
      if(paymentValue != null){
        emit(state.copyWith(paymentValue: paymentValue, errorMessage: ''));
      }
    } catch(e){
      Logger.log(e);
    }
  }

  addToBalance(BuildContext context) async {
    try{
      emit(state.copyWith(isLoading: true, errorMessage: ''));
      final result = await _addBalanceUseCase.call(AddBalanceParams(amount: state.paymentValue, currencyCode: currencyCode));
      context.push(Routes.payment, extra: {'url': result.url, 'trx': result.trx});
    } on Object catch(error){
      String message = ErrorMapper.mapError(error);
      print(message);
      emit(state.copyWith(isLoading: false));
    }
  }
}
