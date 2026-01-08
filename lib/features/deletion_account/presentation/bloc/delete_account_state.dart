part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const DeleteAccountState._();

  @override
  bool get isTimerEnded => when(
    initial: (isTimerEnded) => isTimerEnded,
    loading: (isTimerEnded) => isTimerEnded,
    success: () => false,
    failure: (_, isTimerEnded,) => isTimerEnded,
  );

  const factory DeleteAccountState.success() = _Success;

  const factory DeleteAccountState.loading({  @Default(false) bool isTimerEnded}) = _Loading;

  const factory DeleteAccountState.failure(String message, { @Default(false) bool isTimerEnded}) = _Failure;

  const factory DeleteAccountState.initial({ @Default(false) bool isTimerEnded }) = _Initial;
}
