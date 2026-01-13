part of 'auto_top_up_bloc.dart';


@freezed
class AutoTopUpState with _$AutoTopUpState {
  const AutoTopUpState._();

  List<UserPackageModel> get tariffs => when(
    initial: () => [],
    loading: (tariffs,__) => tariffs,
    success: (tariffs, __) => tariffs,
    failure: (__, tariffs, ___) => tariffs,
    successAutoTopUp: (tariffs, __) => tariffs,
    failedAutoTop: (__, tariffs, ___) => tariffs,
  );

  int? get selectedIndex => when(
    initial: () => null,
    loading: (_,selectedIndex) => selectedIndex,
    success: (_, selectedIndex) => selectedIndex,
    failure: (__, ___, selectedIndex) => selectedIndex,
      successAutoTopUp: (_, selectedIndex) => selectedIndex,
      failedAutoTop: (_, ___, selectedIndex) => selectedIndex,
  );



  const factory AutoTopUpState.success({
    required final List<UserPackageModel> tariffs,
    required final int? selectedIndex,
  }) = _Success;

  const factory AutoTopUpState.successAutoTopUp({
    required final List<UserPackageModel> tariffs,
    required final int? selectedIndex,
  }) = _SuccessAutoTopUp;

  const factory AutoTopUpState.failedAutoTop(String message, {
    @Default([]) final List<UserPackageModel> tariffs,
    @Default(null) final int? selectedIndex
  }) = _FailureAutoTopUp;

  const factory AutoTopUpState.loading({
    @Default([]) final List<UserPackageModel> tariffs,
    @Default(null) final int? selectedIndex,
  }) = _Loading;

  const factory AutoTopUpState.failure(String message, {
    @Default([]) final List<UserPackageModel> tariffs,
    @Default(null) final int? selectedIndex
  }) = _Failure;

  const factory AutoTopUpState.initial() = _Initial;
}
