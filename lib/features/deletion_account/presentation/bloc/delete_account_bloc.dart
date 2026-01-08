import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/confirm_deletion_account_use_case.dart';
import 'package:esim_mob_app/features/profile/domain/use_cases/delete_account_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc({ required ConfirmDeletionAccountUseCase confirmDeletionAccountUseCase, required DeleteAccountUseCase deleteAccountUseCase}) : _confirmDeletionAccountUseCase = confirmDeletionAccountUseCase, _deleteAccountUseCase = deleteAccountUseCase, super(const DeleteAccountState.loading()) {
    on<DeleteAccountEvent>((event, emit) async {
      await event.map(
          sendCode: (e) => _onSendCode(e, emit),
          requestDeletionAccount: (e) => _onRequestDeletion(e, emit),
          timerEnded: (e) => _onTimerEnded(e, emit),
      );
    });

    _timer = Timer(const Duration(seconds: 72), (){
      _timer?.cancel();
      add(const DeleteAccountEvent.timerEnded());
    });
  }

  final int countOfSeconds = 72;
  Timer? _timer;


  final ConfirmDeletionAccountUseCase _confirmDeletionAccountUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  bool isAccountDeleted = false;

  _onSendCode(_SendCode event, Emitter<DeleteAccountState> emit) async {
    try{
      emit(const DeleteAccountState.loading(isTimerEnded: false,));
      await _confirmDeletionAccountUseCase.call(event.code);
      _timer?.cancel();
      emit(const DeleteAccountState.success());
      isAccountDeleted = true;
    } on Object catch (error) {
      String message = ErrorMapper.mapError(error);
      emit(DeleteAccountState.failure(message,));
    }
  }

  _onRequestDeletion(_RequestDeletionAccount event , Emitter<DeleteAccountState> emit) async{
     try{
       emit(const DeleteAccountState.loading(isTimerEnded: false));
       final result = await _deleteAccountUseCase.call(NoParams());
      _timer = Timer(Duration(milliseconds: result.secondsLeft), (){

      });

       emit(DeleteAccountState.initial());
     } on Object catch (error) {
       String message = ErrorMapper.mapError(error);
       emit(DeleteAccountState.failure(message,));
     }
  }


  _onTimerEnded(_TimerEnded event, Emitter<DeleteAccountState> emit){
    emit(const DeleteAccountState.initial(isTimerEnded: true, ));
  }

}
