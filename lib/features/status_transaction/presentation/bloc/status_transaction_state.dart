part of 'status_transaction_bloc.dart';

@freezed
class StatusTransactionState with _$StatusTransactionState {
  const StatusTransactionState._();

  String get transactionId => when(
    initial: () => '',
    pending: (transactionId,) => transactionId,
    failedPayment: (transactionId,) => transactionId,
    success: (transactionId,) => transactionId,
    failure: (_, transactionId,) => transactionId,
  );


  const factory StatusTransactionState.initial() = _Initial;

  const factory StatusTransactionState.pending({
    required String transactionId
  }) = _Pending;

  const factory StatusTransactionState.failedPayment({
    required String transactionId
}) = _FailedPayment;

  const factory StatusTransactionState.success({
    required String transactionId
}) = _Success;

  const factory StatusTransactionState.failure(String message, {
    required String transactionId
}) = _Failure;
}
