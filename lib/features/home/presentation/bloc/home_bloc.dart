
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({ required List<TariffModel> userTariffs }) : super(HomeState.initial(tariffs: userTariffs)) {
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

  Future<void> _onFetchESims(
      _HomeEventFetchESims event, Emitter<HomeState> emit) async {
    emit(HomeState.loading(
        tariffs: state.tariffs, isFirstESim: state.isFirstESim));

    emit(HomeState.success(tariffs: state.tariffs, isFirstESim: state.isFirstESim));
  }

  _onInstallFirstESim(
      _HomeEventInstallFirstESim event, Emitter<HomeState> emit) {
    emit(HomeState.success(tariffs: state.tariffs, isFirstESim: false));
  }

  _onAddESim(_HomeEventAddESim event, Emitter<HomeState> emit){
    emit(HomeState.success(tariffs: [...state.tariffs, event.tariff]));
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
