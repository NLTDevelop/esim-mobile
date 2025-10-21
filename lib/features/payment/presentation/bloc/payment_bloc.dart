

import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_event.dart';

part 'payment_state.dart';

part 'payment_bloc.freezed.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc({ required double price, required String currency}) : super(PaymentState.initial(price: price, currency: currency)) {
    on<PaymentEvent>((event, emit) async {
      await event.map(processPayment: (e) => _onProcessPayment(e, emit));
    });
  }

  Future<void> _onProcessPayment(_PaymentEventProcessPayment event, Emitter<PaymentState> emit) async{
    String? message;
    try{
      emit(PaymentState.loading(price: state.price, currency: state.currency));
      await Future.delayed(const Duration(seconds: 3));
      ///throw InsufficientFundsException();
      emit(PaymentState.success(price: state.price, currency: state.currency));
    } catch (e) {
      message = ErrorMapper.mapError(e);
      emit(PaymentState.failure(price: state.price, currency: state.currency));
    }
  }

  onPay(){
    add(const PaymentEvent.processPayment());
  }
}
