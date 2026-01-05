part of 'store_bloc.dart';

@freezed
class StoreState with _$StoreState {
  const StoreState._();

  List<CountryModel> get countryModels => when(
        initial: () => [],
        loading: (countryModels, __, ___, ____, _____) => countryModels,
        success: (countryModels, __, ___, ____, _____) => countryModels,
        failure: (__, countryModels, ___, ____, ______, _______) => countryModels,
      );

  List<RegionModel> get regionModels => when(
    initial: () => [],
    loading: (__, regionModels, ___, ____, _____) => regionModels,
    success: (__, regionModels, ___, ____, _____) => regionModels,
    failure: (__, ___, regionModels, ____, ______, _______) => regionModels,
  );

  bool get isLoading => maybeMap(
        orElse: () => false,
        loading: (state) => true,
      );

  String get text => when(
        initial: () => '',
        loading: (__, ___, ____, text, _____) => text,
        success: (__, ___, ____, text, _____) => text,
        failure: (__, ___, ____, _____, text, ______) => text,
      );

  bool get isLocal => when(
        initial: () => true,
        loading: (__, ___, isLocal, ____, _____) => isLocal,
        success: (__, ___, isLocal, ____, _____) => isLocal,
        failure: (__, ___, ____, isLocal, _____, ______) => isLocal,
      );

  CurrencyType get currencyType => when(
      success: (__, ___, ____, _____, currencyType) => currencyType,
      loading: (__, ___, ____, _____, currencyType) => currencyType,
      failure: (__, ___, ____, _____, ______, currencyType) => currencyType,
      initial: () => CurrencyType.usd);

  const factory StoreState.success({
    @Default([]) List<CountryModel> countryModels,
    @Default([]) List<RegionModel> regionModels,
    @Default(true) bool isLocal,
    @Default('') String text,
    @Default(CurrencyType.usd) CurrencyType currencyType,
  }) = StoreStateSuccess;

  const factory StoreState.loading({
    @Default([]) List<CountryModel> countryModels,
    @Default([]) List<RegionModel> regionModels,
    @Default(true) bool isLocal,
    @Default('') String text,
    @Default(CurrencyType.usd) CurrencyType currencyType,
  }) = StoreStateLoading;

  const factory StoreState.failure(
    String message, {
    @Default([]) List<CountryModel> countryModels,
        @Default([]) List<RegionModel> regionModels,
    @Default(true) bool isLocal,
    @Default('') String text,
    @Default(CurrencyType.usd) CurrencyType currencyType,
  }) = StoreStateFailure;

  const factory StoreState.initial() = StoreStateInitial;
}
