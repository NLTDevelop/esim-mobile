part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const DeleteAccountState._();

  const factory DeleteAccountState.success() = _Success;

  const factory DeleteAccountState.loading() = _Loading;

  const factory DeleteAccountState.failure(String message) = _Failure;

  const factory DeleteAccountState.initial() = _Initial;
}
