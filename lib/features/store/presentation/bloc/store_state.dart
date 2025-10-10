part of 'store_bloc.dart';

@freezed
class StoreState with _$StoreState {
  const StoreState._();

  List<PlanModel> get planModels => when(
        initial: () => [],
        loading: (planModels, __, ___, ____) => planModels,
        success: (planModels, __, ___, ____) => planModels,
        failure: (__, planModels, ___, ____, _____) => planModels,
      );

  bool get isLoading => maybeMap(
        orElse: () => false,
        loading: (state) => true,
      );

  String get text => when(
        initial: () => '',
        loading: (__, ___, text, ____) => text,
        success: (__, ___, text, ____) => text,
        failure: (__, ___, ____, text, _____) => text,
      );

  bool get isLocal => when(
        initial: () => true,
        loading: (__, isLocal, ____, _____) => isLocal,
        success: (__, isLocal, ____, _____) => isLocal,
        failure: (__, ___, isLocal, _____, ______) => isLocal,
      );

  CurrencyType get currencyType => when(
      success: (__, ___, ____, currencyType) => currencyType,
      loading: (__, ___, ____, currencyType) => currencyType,
      failure: (__, ___, ____, _____, currencyType) => currencyType,
      initial: () => CurrencyType.usd);

  const factory StoreState.success({
    @Default([]) List<PlanModel> planModels,
    @Default(true) bool isLocal,
    @Default('') String text,
    @Default(CurrencyType.usd) CurrencyType currencyType,
  }) = StoreStateSuccess;

  const factory StoreState.loading({
    @Default([]) List<PlanModel> planModels,
    @Default(true) bool isLocal,
    @Default('') String text,
    @Default(CurrencyType.usd) CurrencyType currencyType,
  }) = StoreStateLoading;

  const factory StoreState.failure(
    String message, {
    @Default([]) List<PlanModel> planModels,
    @Default(true) bool isLocal,
    @Default('') String text,
    @Default(CurrencyType.usd) CurrencyType currencyType,
  }) = StoreStateFailure;

  const factory StoreState.initial() = StoreStateInitial;
}
