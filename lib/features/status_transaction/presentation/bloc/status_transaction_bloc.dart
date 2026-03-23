import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/deposit/data/models/deposit_status_model.dart';
import 'package:esim_mob_app/features/deposit/data/models/enums/transaction_status.dart';
import 'package:esim_mob_app/features/deposit/domain/use_cases/fetch_last_transaction_status_use_case.dart';
import 'package:esim_mob_app/features/status_transaction/domain/use_cases/fetch_last_transaction_id_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_transaction_event.dart';
part 'status_transaction_state.dart';
part 'status_transaction_bloc.freezed.dart';

class StatusTransactionBloc extends Bloc<StatusTransactionEvent, StatusTransactionState> {
  StatusTransactionBloc({
    required FetchLastTransactionStatusUseCase fetchLastTransactionStatusUseCase,
    required FetchLastTransactionIdUseCase fetchLastTransactionIdUseCase}) :
        _fetchLastTransactionStatusUseCase = fetchLastTransactionStatusUseCase,
        _fetchLastTransactionIdUseCase = fetchLastTransactionIdUseCase,
        super(const StatusTransactionState.initial()) {
    on<StatusTransactionEvent>((event, emit) async{
      await event.map(fetchLastTransactionStatus: (e) => _onFetchLastTransactionStatus(e, emit));
    });
  }

  final FetchLastTransactionStatusUseCase _fetchLastTransactionStatusUseCase;
  final FetchLastTransactionIdUseCase _fetchLastTransactionIdUseCase;
  Timer? _timer;
  bool _isPending = false;


  _onFetchLastTransactionStatus(_FetchTransactionStatus event, Emitter<StatusTransactionState> emit) async{
    try{
      final String lastTransactionId = await _fetchLastTransactionIdUseCase.call(NoParams()) ?? '';
      final DepositStatusModel transactionModel = await _fetchLastTransactionStatusUseCase.call(lastTransactionId);
      switch(TransactionStatus.values[transactionModel.status - 1]){
        case TransactionStatus.success:
          emit(StatusTransactionState.success(transactionId: lastTransactionId));
          _cancelPeriodicRequest();
          break;
        case TransactionStatus.failed:
        case TransactionStatus.rejected:
          emit(StatusTransactionState.failedPayment(transactionId: lastTransactionId));
          _cancelPeriodicRequest();
          break;
        case TransactionStatus.pending:
          emit(StatusTransactionState.pending(transactionId: lastTransactionId));
          _startPeriodicRequest();
          break;
      }

    } catch(e){
      emit(StatusTransactionState.failure('Something goes wrong', transactionId: ''));
    }

  }

  void _startPeriodicRequest(){
    _timer = Timer.periodic(const Duration(seconds: 60), (t){
      if(_isPending){
        add(const StatusTransactionEvent.fetchLastTransactionStatus());
      } else {
        _timer?.cancel();
      }
    });
  }

  void _cancelPeriodicRequest(){
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
