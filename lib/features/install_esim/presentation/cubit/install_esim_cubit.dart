

import 'package:esim_mob_app/core/utils/esim/esim_installation_handler.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'install_esim_state.dart';
part 'install_esim_cubit.freezed.dart';

class InstallESimCubit extends Cubit<InstallESimState> {
  InstallESimCubit({ required this.title, required this.userESims}) : super(const InstallESimState.listESimsView());

  final String title;
  final List<UserESimModel> userESims;

  chooseESim(int index){
    emit(const InstallESimState.installESimViw());
  }

  installESim(){
    debugPrint('install esim');
    ESimInstallationHandler.installESim(userESims.first.id.toString());
  }

  shareESim(){
    debugPrint('Share esim');
  }
}
