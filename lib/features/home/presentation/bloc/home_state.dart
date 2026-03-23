part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();


  bool get isFirstESim => when(
      loading: (isFirstESim) => isFirstESim,
      failure: (isFirstESim, __) => isFirstESim,
      success: (isFirstESim) => isFirstESim,
      initial: () => true);

  const factory HomeState.loading({
    @Default(true) bool isFirstESim,
  }) = _Loading;

  const factory HomeState.failure({
    @Default(true) bool isFirstESim,
    required final String message,
  }) = _Failure;

  const factory HomeState.success({
    @Default(true) bool isFirstESim,
  }) = _Success;

  const factory HomeState.initial() = _Initial;
}
