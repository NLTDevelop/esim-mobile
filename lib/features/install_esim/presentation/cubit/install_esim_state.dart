part of 'install_esim_cubit.dart';

@freezed
class InstallESimState with _$InstallESimState {
  const factory InstallESimState.listESimsView() = _ListESimView;

  const factory InstallESimState.installESimViw() = _InstallESimView;
}