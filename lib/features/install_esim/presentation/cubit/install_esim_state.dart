part of 'install_esim_cubit.dart';

@freezed
class InstallESimState with _$InstallESimState {

  const factory InstallESimState.listESimsView() = _ListESimView;

  const factory InstallESimState.installESimViw({
    required bool isESimCopied,
}) = _InstallESimView;

  const factory InstallESimState.installationSelectionView({
    required bool isInfoOpen
}) = _InstallationSelectionView;
}