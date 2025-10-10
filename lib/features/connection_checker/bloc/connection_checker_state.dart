part of 'connection_checker_cubit.dart';

@freezed
class ConnectionCheckerState with _$ConnectionCheckerState {
  const factory ConnectionCheckerState.connected() = _Connected;

  const factory ConnectionCheckerState.offline() = _Offline;

  const factory ConnectionCheckerState.unknown() = _Unknown;
}
