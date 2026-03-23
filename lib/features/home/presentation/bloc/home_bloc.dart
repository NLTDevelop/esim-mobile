
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/home/domain/use_cases/fetch_user_esim_use_case.dart';
import 'package:esim_mob_app/features/user/data/models/user_esim_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({ required List<UserESimModel> userTariffs, required FetchUserESimUseCase fetchUserESimUseCase }) : _fetchUserESimUseCase = fetchUserESimUseCase, super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
          fetchESims: (e) => _onFetchESims(e, emit),
          installFirstESim: (e) => _onInstallFirstESim(e, emit),
          addESim: (e) => _onAddESim(e, emit)
      );
    });
  }

  GlobalKey autoTopUpButtonKey = GlobalKey();
  GlobalKey installESimButtonKey = GlobalKey();
  GlobalKey myESimsButtonKey = GlobalKey();

  late TutorialCoachMark tutorialCoachMark;

  final FetchUserESimUseCase _fetchUserESimUseCase;

  List<UserESimModel> userESims = [];

  Future<void> _onFetchESims(
      _HomeEventFetchESims event, Emitter<HomeState> emit) async {
    emit(HomeState.loading(isFirstESim: state.isFirstESim));
    //userESims = (await _fetchUserESimUseCase.call(NoParams()));
    emit(HomeState.success());
  }

  _onInstallFirstESim(
      _HomeEventInstallFirstESim event, Emitter<HomeState> emit) {
    emit(HomeState.success(isFirstESim: false));
  }

  _onAddESim(_HomeEventAddESim event, Emitter<HomeState> emit){
    emit(HomeState.success());
  }

  installFirstESim() {
    add(const _HomeEventInstallFirstESim());
  }

  @override
  Future<void> close() {
    Logger.log('HomeBloc is closed');
    return super.close();
  }
}
