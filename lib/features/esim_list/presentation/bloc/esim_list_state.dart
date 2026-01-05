part of 'esim_list_bloc.dart';

@freezed
class ESimListState with _$ESimListState {
  const ESimListState._();

  List<PlanModel> get eSims => when(
    initial: () => [],
    loading: (eSims,) => eSims,
    success: (eSims,) => eSims,
    failure: (__, eSims,) => eSims,
  );


  const factory ESimListState.success({
    required List<PlanModel> eSims,
  }) = ESimListStateSuccess;

  const factory ESimListState.loading({
    @Default([]) List<PlanModel> eSims,
  }) = ESimListStateLoading;

  const factory ESimListState.failure(
      String message, {
        @Default([]) List<PlanModel> eSims,
      }) = ESimListStateFailure;

  const factory ESimListState.initial() = ESimListStateInitial;
}
