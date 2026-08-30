part of 'preview_tariffs_bloc.dart';

@freezed
class PreviewTariffsState with _$PreviewTariffsState {
  const PreviewTariffsState._();


  List<PackageModel> get tariffs => when(
    initial: () => [],
    loading: (tariffs, __, ___) => tariffs,
    success: (tariffs, __, ___, ____) => tariffs,
    failure: (__, tariffs, ___, ____) => tariffs,
  );

  List<String> get coverages => when(
    initial: () => [],
    loading: (_, __, ___) => [],
    success: (_, __, ___, coverages) => coverages,
    failure: (__, tariffs, ___, ____) => [],
  );

  bool get isLoading => maybeMap(
    orElse: () => false,
    loading: (state) => true,
  );

  int get selectedIndex => when(
    initial: () => 0,
    loading: (__, ___, selectedIndex) => selectedIndex,
    success: (__, ___, selectedIndex, ____) => selectedIndex,
    failure: (__, ___, ____, selectedIndex) => selectedIndex,
  );

  String? get image => when(
      initial: () => null,
      loading: (_, image, __) => image,
      success: (_, image, __, ___) => image,
      failure: (_, __,image, ___,) => image,
  );

  const factory PreviewTariffsState.success({
    required final List<PackageModel> tariffs,
    required final String? image,
    @Default(0) final int selectedIndex,
    @Default(<String>[]) final List<String> coverages,
  }) = PreviewTariffsSuccess;

  const factory PreviewTariffsState.loading({
   required final List<PackageModel> tariffs,
    String? image,
    @Default(0) int selectedIndex
  }) = PreviewTariffsLoading;

  const factory PreviewTariffsState.failure(
      String message, {
        @Default(<PackageModel>[]) List<PackageModel> tariffs,
        String? image,
        @Default(0) int selectedIndex,
      }) = PreviewTariffsFailure;

  const factory PreviewTariffsState.initial() = PreviewTariffsStateInitial;
}
