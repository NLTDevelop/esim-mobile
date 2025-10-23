part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  @override
  List<TariffModel> get tariffs => when(
        initial: (tariffs) => tariffs,
        loading: (tariffs, __) => tariffs,
        success: (tariffs, __) => tariffs,
        failure: (tariffs, __, ___) => tariffs,
      );

  bool get isFirstESim => when(
      loading: (_, isFirstESim) => isFirstESim,
      failure: (_, isFirstESim, __) => isFirstESim,
      success: (_, isFirstESim) => isFirstESim,
      initial: (_) => true);

  const factory HomeState.loading({
    @Default([]) final List<TariffModel> tariffs,
    @Default(true) bool isFirstESim,
  }) = _Loading;

  const factory HomeState.failure({
    @Default([]) final List<TariffModel> tariffs,
    @Default(true) bool isFirstESim,
    required final String message,
  }) = _Failure;

  const factory HomeState.success({
    @Default([]) final List<TariffModel> tariffs,
    @Default(true) bool isFirstESim,
  }) = _Success;

  const factory HomeState.initial({@Default([]) final List<TariffModel> tariffs,}) = _Initial;
}
