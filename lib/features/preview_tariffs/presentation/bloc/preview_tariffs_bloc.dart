
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_tariffs_event.dart';

part 'preview_tariffs_state.dart';

part 'preview_tariffs_bloc.freezed.dart';

class PreviewTariffsBloc
    extends Bloc<PreviewTariffsEvent, PreviewTariffsState> {
  PreviewTariffsBloc({required PlanModel plan, required BaseCountry countryEntity, this.isFromWelcome = false})
      : _countryEntity = countryEntity, _plan = plan, super(const PreviewTariffsState.initial()) {
    on<PreviewTariffsEvent>((event, emit) {
      event.map(fetchTariffs: (event) => _onFetchTariffs(event, emit), selectIndex: (event) => _onSelectIndex(event, emit));
    });
  }

  final BaseCountry _countryEntity;
  final PlanModel _plan;

  BaseCountry get countryEntity => _countryEntity;
  List<PackageModel> get tariffs => _plan.packages;
  PlanModel get plan => _plan;

  bool get isLocal => _countryEntity is CountryModel;

  final bool isFromWelcome;



  void _onFetchTariffs(_PreviewTariffsEventFetchTariffs event, Emitter<PreviewTariffsState> emit){
    emit(
      PreviewTariffsState.loading(
        tariffs: state.tariffs,
        selectedIndex: state.selectedIndex
      )
    );

    emit(
      PreviewTariffsState.success(
        tariffs: _plan.packages,
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
