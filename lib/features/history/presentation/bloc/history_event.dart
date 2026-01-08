part of 'history_bloc.dart';

@freezed
class HistoryEvent with _$HistoryEvent {
  const factory HistoryEvent.fetchHistory({void Function()? onSuccess}) =
  _HistoryEventFetchPlans;


  const factory HistoryEvent.loadTransactions() = _HistoryEventLoadTransactions;
}
