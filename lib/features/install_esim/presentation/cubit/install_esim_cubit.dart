

import 'package:clipboard/clipboard.dart';
import 'package:esim_mob_app/core/constants/variables.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/core/utils/esim/esim_installation_handler.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/home/domain/use_cases/fetch_user_esim_by_id_use_case.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_detail_model.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'install_esim_state.dart';
part 'install_esim_cubit.freezed.dart';

class InstallESimCubit extends Cubit<InstallESimState> {
  InstallESimCubit({ required this.userESims, required FetchUserESimByIdUseCase fetchUserESimByIdUseCase}) : _fetchUserESimByIdUseCase = fetchUserESimByIdUseCase, super(const InstallESimState.listESimsView(isLoading: false));

  final FetchUserESimByIdUseCase _fetchUserESimByIdUseCase;
  final List<UserESimModel> userESims;

  int _chosenIndex = 0;
  int get chosenIndex => _chosenIndex;

  chooseESim(int index) async{
    try{
      _chosenIndex = index;
      emit(const InstallESimState.listESimsView(isLoading: true));
      UserESimDetailModel userESimActivationDetail = await _fetchUserESimByIdUseCase.call(userESims[index].id);

      emit(InstallESimState.installESimViw(isESimCopied: false, userESimDetailModel: userESimActivationDetail));
    } on Object catch (error) {
      String errorMessage = ErrorMapper.mapError(error);
      Logger.error(errorMessage);
      emit(InstallESimState.listESimsView(errorMessage: errorMessage, isLoading: false));
    }

  }

  installESim(){
    debugPrint('install eSim');

    if(state.userESimDetailModel != null){
      debugPrint(state.userESimDetailModel!.qrText);
      ESimInstallationHandler.installESim(state.userESimDetailModel!.qrText);
    }
  }

  installESimManually() async {
    await FlutterClipboard.copy(kTest3ESimPackage);
    emit(InstallESimState.installESimViw(isESimCopied: true, userESimDetailModel: state.userESimDetailModel!));
    emit(InstallESimState.installESimViw(isESimCopied: false, userESimDetailModel: state.userESimDetailModel!));
  }

  shareESim(){
    debugPrint('Share esim');
  }
}
