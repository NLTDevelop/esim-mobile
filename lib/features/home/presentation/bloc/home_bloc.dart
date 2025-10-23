import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
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
          installFirstESim: (e) => _onInstallFirstESim(e, emit));
    });
  }

  GlobalKey autoTopUpButtonKey = GlobalKey();
  GlobalKey installESimButtonKey = GlobalKey();
  GlobalKey myESimsButtonKey = GlobalKey();

  final List<ESimModel> eSims = [
    ESimModel(
        name: 'Netherlands',
        dataInGB: 3,
        days: 7,
        createdAt: DateTime.now(),
        iconPath: AppIcons.netherlands,
        isActive: true),
    ESimModel(
        name: 'Indonesia',
        dataInGB: 15,
        days: 30,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        iconPath: AppIcons.indonesia),
    ESimModel(
        name: 'USA',
        dataInGB: 1,
        days: 3,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        iconPath: AppIcons.usa),
    ESimModel(
        name: 'USA',
        dataInGB: 1,
        days: 3,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        iconPath: AppIcons.usa),
  ];

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

  installFirstESim() {
    add(const _HomeEventInstallFirstESim());
  }
}
