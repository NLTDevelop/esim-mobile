
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_top_up_event.dart';

part 'auto_top_up_state.dart';

part 'auto_top_up_bloc.freezed.dart';

class AutoTopUpBloc extends Bloc<AutoTopUpEvent, AutoTopUpState> {
  AutoTopUpBloc() : super(const AutoTopUpState.loading()) {
    on<AutoTopUpEvent>((event, emit) async {
      event.map(fetchTariffs: (e) async => await _onFetchTariffs(e, emit), selectTariff: (e) => _onSelectTariff(e, emit));
    });
  }

  Future<void> _onFetchTariffs(_AutoTopUpEventFetchTariffs event, Emitter<AutoTopUpState> emit) async{
    String? message;
    try{
      emit(const AutoTopUpState.loading());
      List<TariffModel> tariffs = [
        TariffModel(dataInGB: 1, price: 2.49, durationInDays: 7, eSim: ESimModel(name: 'Netherlands', dataInGB: 1, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.netherlands)),
        TariffModel(dataInGB: 3, price: 10.49, durationInDays: 30, eSim: ESimModel(name: 'USA', dataInGB: 3, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
        TariffModel(dataInGB: 5, price: 19.49, durationInDays: 30, eSim: ESimModel(name: 'Indonesia', dataInGB: 5, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.indonesia)),
        TariffModel(dataInGB: 50, price: 95.99, durationInDays: 90, eSim: ESimModel(name: 'USA', dataInGB: 3, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
      ];
      emit(AutoTopUpState.success(tariffs: tariffs, selectedIndex: state.selectedIndex));
    } on Object catch (error) {
      message = ErrorMapper.mapError(error);
      emit(AutoTopUpState.failure(message));
    }
  }

  void _onSelectTariff(_AutoTopUpEventSelectTariff event, Emitter<AutoTopUpState> emit){
    emit(AutoTopUpState.success(tariffs: state.tariffs, selectedIndex: event.selectedIndex));
  }

  void selectTariff(int index){
    add(_AutoTopUpEventSelectTariff(selectedIndex: index));
  }
}
