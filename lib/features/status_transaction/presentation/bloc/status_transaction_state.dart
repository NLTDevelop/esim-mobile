part of 'status_transaction_bloc.dart';

@freezed
class StatusTransactionState with _$StatusTransactionState {
  const StatusTransactionState._();

  String get transactionId => when(
    initial: () => '',
    pending: (transactionId, _) => transactionId,
    failedPayment: (transactionId,_) => transactionId,
    success: (transactionId,_) => transactionId,
    failure: (_, transactionId, __) => transactionId,
  );

  int get status => when(
    initial: () => 0,
    pending: (_, status) => status,
    failedPayment: (_, status) => status,
    success: (_, status) => status,
    failure: (_, __, status,) => status,
  );

  const factory StatusTransactionState.initial() = _Initial;

  const factory StatusTransactionState.pending({
    required String transactionId,
    required int status,
  }) = _Pending;

  const factory StatusTransactionState.failedPayment({
    required String transactionId,
    required int status,
}) = _FailedPayment;

  const factory StatusTransactionState.success({
    required String transactionId,
    required int status,
}) = _Success;

  const factory StatusTransactionState.failure(String message, {
    required String transactionId,
    required int status,
}) = _Failure;
}
