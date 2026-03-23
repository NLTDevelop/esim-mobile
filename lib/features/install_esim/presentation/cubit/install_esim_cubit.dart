

import 'package:clipboard/clipboard.dart';
import 'package:esim_mob_app/core/constants/variables.dart';
import 'package:esim_mob_app/core/utils/esim/esim_installation_handler.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'install_esim_state.dart';
part 'install_esim_cubit.freezed.dart';

class InstallESimCubit extends Cubit<InstallESimState> {
  InstallESimCubit({ required this.userESims}) : super(const InstallESimState.listESimsView());

  final List<UserESimModel> userESims;
  int _chosenIndex = 0;
  int get chosenIndex => _chosenIndex;

  chooseESim(int index){
    _chosenIndex = index;
    emit(const InstallESimState.installESimViw(isESimCopied: false));
  }

  installESim(){
    debugPrint('install esim');

    ESimInstallationHandler.installESim(kTest3ESimPackage);
  }

  installESimManually() async {
    await FlutterClipboard.copy(kTest3ESimPackage);
    emit(const InstallESimState.installESimViw(isESimCopied: true));
    emit(const InstallESimState.installESimViw(isESimCopied: false));
  }

  shareESim(){
    debugPrint('Share esim');
  }
}
