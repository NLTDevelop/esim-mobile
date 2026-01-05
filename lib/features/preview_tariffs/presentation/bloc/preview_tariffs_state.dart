part of 'preview_tariffs_bloc.dart';

@freezed
class PreviewTariffsState with _$PreviewTariffsState {
  const PreviewTariffsState._();


  List<PackageModel> get tariffs => when(
    initial: () => [],
    loading: (tariffs, __,) => tariffs,
    success: (tariffs, __,) => tariffs,
    failure: (__, tariffs, ___,) => tariffs,
  );

  bool get isLoading => maybeMap(
    orElse: () => false,
    loading: (state) => true,
  );

  int get selectedIndex => when(
    initial: () => 0,
    loading: (__, selectedIndex) => selectedIndex,
    success: (__, selectedIndex) => selectedIndex,
    failure: (__, ___, selectedIndex) => selectedIndex,
  );

  const factory PreviewTariffsState.success({
    @Default([]) List<PackageModel> tariffs,
    @Default(0) int selectedIndex,
  }) = PreviewTariffsSuccess;

  const factory PreviewTariffsState.loading({
    @Default([]) List<PackageModel> tariffs,
    @Default(0) int selectedIndex
  }) = PreviewTariffsLoading;

  const factory PreviewTariffsState.failure(
      String message, {
        @Default([]) List<PackageModel> tariffs,
        @Default(0) int selectedIndex
      }) = PreviewTariffsFailure;

  const factory PreviewTariffsState.initial() = PreviewTariffsStateInitial;
}
