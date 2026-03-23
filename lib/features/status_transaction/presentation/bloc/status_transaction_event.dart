part of 'status_transaction_bloc.dart';

@freezed
class StatusTransactionEvent with _$StatusTransactionEvent {
  const factory StatusTransactionEvent.fetchLastTransactionStatus() = _FetchTransactionStatus;
}
