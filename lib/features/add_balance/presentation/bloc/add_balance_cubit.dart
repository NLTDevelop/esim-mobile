

import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/add_balance/data/model/payent_getaway_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_balance_state.dart';

class AddBalanceCubit extends Cubit<AddBalanceState> {
  AddBalanceCubit() : super(const AddBalanceState(paymentGetawayType: PaymentGetawayType.stripe, paymentValue: 5));

  onChangePaymentGetaway(PaymentGetawayType type){
    emit(state.copyWith(paymentGetawayType: type));
  }
  
  onChangePaymentValue(String value){
    try{
      double? paymentValue = double.tryParse(value);
      if(paymentValue != null){
        emit(state.copyWith(paymentValue: paymentValue));
      }
    } catch(e){
      Logger.log(e);
    }
  }
}
