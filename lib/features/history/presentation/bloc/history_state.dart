part of 'history_bloc.dart';

@freezed
class HistoryState with _$HistoryState {
  const HistoryState._();

  List<TransactionModel> get transactions => when(
    initial: () => [],
    loading: (transactions, __) => transactions,
    success: (transactions) => transactions,
    failure: (__, transactions) => transactions,
  );

  bool get isLoading => maybeMap(
    orElse: () => false,
    loading: (state) => true,
  );

  const factory HistoryState.initial() = HistoryStateInitial;

  const factory HistoryState.success({
   required List<TransactionModel> transactions,
  }) = HistoryStateSuccess;

  const factory HistoryState.loading({
   required List<TransactionModel> transactions,
    @Default(false) bool isFirstFetch,
  }) = HistoryStateLoading;

  const factory HistoryState.failure(
      String message, {
        @Default([]) List<TransactionModel> transactions,
      }) = HistoryStateFailure;

}
