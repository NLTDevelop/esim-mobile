part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  List<TariffModel> get tariffs => when(
    initial: () => [],
    loading: (tariffs) => tariffs,
    success: (tariffs) => tariffs,
    failure: (tariffs, __) => tariffs,
  );


  const factory HomeState.loading({
    @Default([]) final List<TariffModel> tariffs,
  }) = _Loading;

  const factory HomeState.failure({
    @Default([]) final List<TariffModel> tariffs,
    required final String message,
  }) = _Failure;

  const factory HomeState.success({
    @Default([]) final List<TariffModel> tariffs,
  }) = _Success;

  const factory HomeState.initial() = _Initial;
}
