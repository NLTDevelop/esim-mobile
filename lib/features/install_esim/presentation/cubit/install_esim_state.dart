part of 'install_esim_cubit.dart';

@freezed
class InstallESimState with _$InstallESimState {
  const InstallESimState._();

  UserESimDetailModel? get userESimDetailModel => when(
    listESimsView: (_, __) => null,
    installESimViw: (_, userESimDetailModel) => userESimDetailModel,
      installationSelectionView: (_) => null,
  );

  bool get isLoading => when(
    listESimsView: (isLoading, _) => isLoading,
    installESimViw: (_, __) => false,
    installationSelectionView: (_) => false,
  );

  const factory InstallESimState.listESimsView({required bool isLoading, String? errorMessage}) = _ListESimView;

  const factory InstallESimState.installESimViw({
    required bool isESimCopied,
    required UserESimDetailModel userESimDetailModel
}) = _InstallESimView;

  const factory InstallESimState.installationSelectionView({
    required bool isInfoOpen
}) = _InstallationSelectionView;
}