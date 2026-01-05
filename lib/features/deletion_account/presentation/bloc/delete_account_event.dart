part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountEvent with _$DeleteAccountEvent {
  const factory DeleteAccountEvent.requestDeletionAccount() = _RequestDeletionAccount;
  const factory DeleteAccountEvent.sendCode({required String code}) = _SendCode;
}
