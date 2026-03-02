part of 'esim_installation_checker_cubit.dart';

@freezed
class EsimInstallationCheckerState with _$EsimInstallationCheckerState {
  const EsimInstallationCheckerState._();

  @override
  bool get canInstallESim => when(
    initial: () => false,
    finish: (canInstallESim) => canInstallESim,
  );

  const factory EsimInstallationCheckerState.initial() = _Initial;

  const factory EsimInstallationCheckerState.finish({
    required bool canInstallESim,
}) = _Finish;
}
