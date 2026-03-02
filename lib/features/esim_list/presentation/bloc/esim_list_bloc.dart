import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/features/store/data/models/base_country.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:esim_mob_app/features/store/data/models/plans_response_model.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_local_esims_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regional_esims_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'esim_list_bloc.freezed.dart';

part 'esim_list_event.dart';
part 'esim_list_state.dart';

class ESimListBloc extends Bloc<ESimListEvent, ESimListState> {
  ESimListBloc({ required FetchLocalESimsUseCase fetchLocalESimsUseCase, required FetchRegionalESimsUseCase fetchRegionalESimsUseCase, required this.currencyCode, required this.baseCountryEntity,required this.isFromWelcome} ) : _fetchLocalESimsUseCase = fetchLocalESimsUseCase, _fetchRegionalESimsUseCase = fetchRegionalESimsUseCase, super(const ESimListState.initial()) {
    on<ESimListEvent>((event, emit) async {
      await event.map(fetchListESims: (e) => _onFetchListESims(e, emit));
    });
  }

  final FetchLocalESimsUseCase _fetchLocalESimsUseCase;
  final FetchRegionalESimsUseCase _fetchRegionalESimsUseCase;
  final String currencyCode;
  final BaseCountry baseCountryEntity;
  final bool isFromWelcome;

  _onFetchListESims(_FetchListESims e, Emitter<ESimListState> emit) async{
    emit(const ESimListState.loading());
    List<PlanModel> eSims = [];
    if(baseCountryEntity is CountryModel){
      eSims = await _fetchLocalESimsUseCase.call(FetchLocalESimsParams(countryCode: (baseCountryEntity as CountryModel).code, currencyCode: currencyCode));
    } else {
      eSims = await _fetchRegionalESimsUseCase.call(FetchRegionalESimsParams(regionalId: (baseCountryEntity as RegionModel).id.toString(), currencyCode: currencyCode));
    }

    emit(ESimListState.success(eSims: eSims));
  }
}
