part of 'auto_top_up_bloc.dart';


@freezed
class AutoTopUpState with _$AutoTopUpState {
  const AutoTopUpState._();

  List<PackageModel> get tariffs => when(
    initial: () => [],
    loading: (tariffs,__) => tariffs,
    success: (tariffs, __) => tariffs,
    failure: (__, tariffs, ___) => tariffs,
  );

  int? get selectedIndex => when(
    initial: () => null,
    loading: (_,selectedIndex) => selectedIndex,
    success: (_, selectedIndex) => selectedIndex,
    failure: (__, ___, selectedIndex) => selectedIndex,
  );



  const factory AutoTopUpState.success({
    required final List<PackageModel> tariffs,
    required final int? selectedIndex,
  }) = _Success;

  const factory AutoTopUpState.loading({
    @Default([]) final List<PackageModel> tariffs,
    @Default(null) final int? selectedIndex,
  }) = _Loading;

  const factory AutoTopUpState.failure(String message, {
    @Default([]) final List<PackageModel> tariffs,
    @Default(null) final int? selectedIndex
  }) = _Failure;

  const factory AutoTopUpState.initial() = _Initial;
}
