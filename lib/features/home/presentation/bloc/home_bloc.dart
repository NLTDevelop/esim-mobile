
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.map(fetchESims: (e) => _onFetchESims(e, emit));
    });
  }

  final List<ESimModel> eSims = [
    ESimModel(name: 'Netherlands', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.netherlands, isActive: true),
    ESimModel(name: 'Indonesia', dataInGB: 15, days: 30, createdAt: DateTime.now().subtract(const Duration(days: 1)), iconPath: AppIcons.indonesia),
    ESimModel(name: 'USA', dataInGB: 1, days: 3, createdAt: DateTime.now().subtract(const Duration(days: 2)), iconPath: AppIcons.usa),
    ESimModel(name: 'USA', dataInGB: 1, days: 3, createdAt: DateTime.now().subtract(const Duration(days: 2)), iconPath: AppIcons.usa),
  ];

  Future<void> _onFetchESims(_HomeEventFetchESims event, Emitter<HomeState> emit) async{
    emit(HomeState.loading());

    emit(HomeState.success(tariffs: []));
  }
}
