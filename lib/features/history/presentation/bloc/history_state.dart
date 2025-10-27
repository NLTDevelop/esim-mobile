part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const HistoryState._();

  List<TransactionModel> get transactions => when(
    loading: (transactions) => transactions,
    success: (transactions) => transactions,
    failure: (__, transactions) => transactions,
  );

  bool get isLoading => maybeMap(
    orElse: () => false,
    loading: (state) => true,
  );

  const factory HistoryState.success({
   required List<TransactionModel> transactions,
  }) = HistoryStateSuccess;

  const factory HistoryState.loading({
   required List<TransactionModel> transactions,
  }) = HistoryStateLoading;

  const factory HistoryState.failure(
      String message, {
        @Default([]) List<TransactionModel> transactions,
      }) = HistoryStateFailure;

}
