import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_tariffs_event.dart';

part 'preview_tariffs_state.dart';

part 'preview_tariffs_bloc.freezed.dart';

class PreviewTariffsBloc
    extends Bloc<PreviewTariffsEvent, PreviewTariffsState> {
  PreviewTariffsBloc({required String country, required String iconPath})
      : _country = country,
        _iconPath = iconPath,
        super(const PreviewTariffsState.initial()) {
    on<PreviewTariffsEvent>((event, emit) {
      event.map(fetchTariffs: (event) => _onFetchTariffs(event, emit), selectIndex: (event) => _onSelectIndex(event, emit));
    });
  }

  final String _country;
  final String _iconPath;

  String get country => _country;
  String get iconPath => _iconPath;


  void _onFetchTariffs(_PreviewTariffsEventFetchTariffs event, Emitter<PreviewTariffsState> emit){
    emit(
      PreviewTariffsState.loading(
        tariffs: state.tariffs,
        selectedIndex: state.selectedIndex
      )
    );

    List<TariffModel> tariffs = [
      TariffModel(dataInGB: 1, price: 2.49, durationInDays: 7, eSim: ESimModel(name: 'Netherlands', dataInGB: 1, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.netherlands)),
      TariffModel(dataInGB: 3, price: 10.49, durationInDays: 30, eSim: ESimModel(name: 'USA', dataInGB: 3, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
      TariffModel(dataInGB: 5, price: 19.49, durationInDays: 30, eSim: ESimModel(name: 'Indonesia', dataInGB: 5, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.indonesia)),
      TariffModel(dataInGB: 50, price: 95.99, durationInDays: 90, eSim: ESimModel(name: 'USA', dataInGB: 3, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
    ];

    emit(
      PreviewTariffsState.success(
        tariffs: tariffs,
        selectedIndex: state.selectedIndex,
      )
    );
  }

  void _onSelectIndex(_PreviewTariffsEventSelectIndex event, Emitter<PreviewTariffsState> emit){

    emit(
        PreviewTariffsState.success(
          tariffs: state.tariffs,
          selectedIndex: event.selectedIndex,
        )
    );
  }
}
