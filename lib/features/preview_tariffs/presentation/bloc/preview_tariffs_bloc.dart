
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/core/utils/logger/logger.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_local_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regional_esims_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_tariffs_event.dart';

part 'preview_tariffs_state.dart';

part 'preview_tariffs_bloc.freezed.dart';

class PreviewTariffsBloc
    extends Bloc<PreviewTariffsEvent, PreviewTariffsState> {
  PreviewTariffsBloc({
    required FetchRegionalESimsUseCase fetchRegionalESimsUseCase,
    required FetchLocalESimsUseCase fetchLocalESimsUseCase,
    required BaseCountry countryEntity,
    required String currency,
    this.isFromWelcome = false})
      : _countryEntity = countryEntity,
        _currency = currency,
        _fetchLocalESimsUseCase = fetchLocalESimsUseCase,
  _fetchRegionalESimsUseCase = fetchRegionalESimsUseCase,
        super(const PreviewTariffsState.initial()) {
    on<PreviewTariffsEvent>((event, emit) async {
      await event.map(fetchTariffs: (event) => _onFetchTariffs(event, emit), selectIndex: (event) => _onSelectIndex(event, emit));
    });
  }

  final BaseCountry _countryEntity;

  BaseCountry get countryEntity => _countryEntity;
  // List<PackageModel> get tariffs => _plan.packages;
  // PlanModel get plan => _plan;


  final FetchRegionalESimsUseCase _fetchRegionalESimsUseCase;
  final FetchLocalESimsUseCase _fetchLocalESimsUseCase;

  //String? get countryCodeFromPrivacyIPLocation => _plan.privacyIPLocation;
  String? get countryCodeFromCountryModel => (_countryEntity as CountryModel).code;

  bool get isLocal => _countryEntity is CountryModel;

  final String _currency;
  final bool isFromWelcome;



  _onFetchTariffs(_PreviewTariffsEventFetchTariffs event, Emitter<PreviewTariffsState> emit) async{
    try{
      emit(
          PreviewTariffsState.loading(
              tariffs: [],
              selectedIndex: state.selectedIndex
          )
      );

      List<PlanModel> plans = [];

      if(countryEntity is RegionModel){
        plans = await _fetchRegionalESimsUseCase.call(FetchRegionalESimsParams(regionalId: (countryEntity as RegionModel).id.toString(), currencyCode: _currency));
      } else {
        plans = await _fetchLocalESimsUseCase.call(FetchLocalESimsParams(countryCode: (countryEntity as CountryModel).code, currencyCode: _currency));
      }

      if(plans.isNotEmpty){
        emit(
            PreviewTariffsState.success(
              tariffs: [...plans[0].packages],
              selectedIndex: state.selectedIndex, image: plans[0].image,
            )
        );
      } else {
        emit(PreviewTariffsState.failure('No eSim plans'));
      }


    } on Object catch (error) {
      Logger.error(error);
      String message = ErrorMapper.mapError(error);
      emit(PreviewTariffsState.failure(message));
    }
  }

  _onSelectIndex(_PreviewTariffsEventSelectIndex event, Emitter<PreviewTariffsState> emit) async{

    emit(
        PreviewTariffsState.success(
          tariffs: state.tariffs,
          selectedIndex: event.selectedIndex, image: state.image,
        )
    );
  }
}
