

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'install_esim_state.dart';
part 'install_esim_cubit.freezed.dart';

class InstallESimCubit extends Cubit<InstallESimState> {
  InstallESimCubit({ required this.title}) : super(const InstallESimState.listESimsView());

  final String title;

  chooseESim(int index){
    emit(const InstallESimState.installESimViw());
  }

  installESim(){
    debugPrint('install esim');
  }

  shareESim(){
    debugPrint('Share esim');
  }
}
