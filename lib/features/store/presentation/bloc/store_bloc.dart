
import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/core/use_case/use_case.dart';
import 'package:esim_mob_app/features/store/data/models/country_model.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:esim_mob_app/features/store/data/models/region_model.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_countries_use_case.dart';
import 'package:esim_mob_app/features/store/domain/use_cases/fetch_regions_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'store_event.dart';

part 'store_state.dart';

part 'store_bloc.freezed.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc(FetchRegionsUseCase fetchRegionsUseCase, FetchCountriesUseCase fetchCountriesUseCase, {this.isFromWelcome = false}) : _fetchRegionsUseCase = fetchRegionsUseCase, _fetchCountriesUseCase = fetchCountriesUseCase, super(const StoreState.initial()) {
    on<_StoreEventChangeCurrencyType>(_onChangeCurrencyType);
    on<_StoreEventFetchPlans>(_onFetchPlans);
    on<_StoreEventSetText>(_onSetSearchText, transformer: debounceTransformer(const Duration(milliseconds: 500)));
    on<_StoreEventChangePlansType>(_onChangePlansType);
  }

  EventTransformer<E> debounceTransformer<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }


  final FetchCountriesUseCase _fetchCountriesUseCase;
  final FetchRegionsUseCase _fetchRegionsUseCase;

  final bool isFromWelcome;
  final List<CountryModel> allCountries = [];
  
  Future<void> _onFetchPlans(_StoreEventFetchPlans event,
      Emitter<StoreState> emit) async{
    allCountries.clear();
    emit(
      StoreState.loading(
        countryModels: state.countryModels,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );

    try {
      // String countryCode = PlatformDispatcher.instance.locale.countryCode ?? '';
      // final plans = await _fetchLocalESimsUseCase.call(FetchLocalESimsParams(countryCode: countryCode, currencyCode: 'USD'));
      // final regionalPlans = await _fetchRegionalESimsUseCase.call(FetchRegionalESimsParams(regionalId: "1", currencyCode: 'USD'));
      final countries = await _fetchCountriesUseCase.call(NoParams());
      final regions = await _fetchRegionsUseCase.call(NoParams());

      ///await Future.delayed(const Duration(milliseconds: 2000));
      allCountries.addAll(countries);

      emit(
          StoreState.success(
          countryModels: countries,
          regionModels: regions,
          isLocal: state.isLocal,
          text: state.text
        )
      );
    } catch (e) {
      print(e);
      emit(StoreState.failure(e.toString()));
    }
  }

  onChangeSearchText(String text){
    add(_StoreEventSetText(text));
  }

  void _onSetSearchText(_StoreEventSetText event,Emitter<StoreState> emit){
    emit(
      StoreState.loading(
        countryModels: allCountries,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );

    final searchedCountries = allCountries.where((e) => e.name.toLowerCase().contains(event.text.toLowerCase())).toList();

    emit(StoreState.success(countryModels: searchedCountries, isLocal: state.isLocal, text: event.text));
  }

  void _onChangePlansType(_StoreEventChangePlansType event,Emitter<StoreState> emit){

    emit(StoreState.success(
      isLocal: event.isLocal,
      text: state.text,
        regionModels: state.regionModels,
        countryModels: state.countryModels
    ));

  }

  Future<void> _onChangeCurrencyType(_StoreEventChangeCurrencyType event, Emitter<StoreState> emit) async {

    emit(StoreState.success(
      isLocal: state.isLocal,
      text: state.text,
      currencyType: event.type,
        regionModels: state.regionModels,
        countryModels: state.countryModels
    ));
  }
}
