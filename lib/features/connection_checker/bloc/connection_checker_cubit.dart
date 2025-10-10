import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_checker_cubit.freezed.dart';
part 'connection_checker_state.dart';

class ConnectionCheckerCubit extends Cubit<ConnectionCheckerState> {
  final _connectivity = Connectivity();
  late final StreamSubscription _connectivityStream;

  ConnectionCheckerCubit() : super(const _Unknown()) {
    _connectivityStream = _connectivity.onConnectivityChanged.listen(_connectivityListener);
  }

  void _connectivityListener(List<ConnectivityResult> res) {
    if (res.contains(ConnectivityResult.wifi) || res.contains(ConnectivityResult.mobile)) {
      emit(const _Connected());
    } else if (res.contains(ConnectivityResult.none)) {
      emit(const _Offline());
    } else {
      emit(const _Unknown());
    }
  }

  Future<void> recheckConnection() async => _connectivityListener(await _connectivity.checkConnectivity());

  @override
  Future<void> close() {
    _connectivityStream.cancel();
    return super.close();
  }
}
