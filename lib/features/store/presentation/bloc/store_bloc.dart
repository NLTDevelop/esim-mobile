import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/features/home/data/models/esim_model.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';
import 'package:rxdart/rxdart.dart';

part 'store_event.dart';

part 'store_state.dart';

part 'store_bloc.freezed.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc({ this.isFromWelcome = false}) : super(const StoreState.initial()) {
    on<_StoreEventChangeCurrencyType>(_onChangeCurrencyType);
    on<_StoreEventFetchPlans>(_onFetchPlans);
    on<_StoreEventSetText>(_onSetSearchText, transformer: debounceTransformer(const Duration(milliseconds: 500)));
    on<_StoreEventChangePlansType>(_onChangePlansType);
  }

  EventTransformer<E> debounceTransformer<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  final bool isFromWelcome;


  final List<PlanModel> plans =  [
    PlanModel(id: 1, title: 'Turkey', isLocal: true, price: 1.11, iconPath: AppIcons.turkey, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Turkey', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.turkey)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Turkey', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.turkey)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Turkey', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.turkey)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Turkey', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.turkey)),
    ]),
    PlanModel(id: 1, title: 'Thailand', isLocal: true, price: 1.11, iconPath: AppIcons.thailand, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Thailand', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.thailand)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Thailand', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.thailand)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Thailand', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.thailand)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Thailand', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.thailand)),
    ]),
    PlanModel(id: 1, title: 'Indonesia', isLocal: true, price: 1.11, iconPath: AppIcons.indonesia, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Indonesia', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.indonesia)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Indonesia', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.indonesia)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Indonesia', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.indonesia)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Indonesia', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.indonesia)),
    ]),
    PlanModel(id: 1, title: 'Japan', isLocal: true, price: 1.11, iconPath: AppIcons.japan, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Japan', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.japan)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Japan', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.japan)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Japan', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.japan)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Japan', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.japan)),
    ]),
    PlanModel(id: 1, title: 'Malaysia', isLocal: true, price: 1.11, iconPath: AppIcons.malaysia,tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Malaysia', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.malaysia)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Malaysia', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.malaysia)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Malaysia', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.malaysia)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Malaysia', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.malaysia)),
    ]),
    PlanModel(id: 1, title: 'USA', isLocal: true, price: 1.11, iconPath: AppIcons.usa, tariffs:  [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'USA', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
      TariffModel(price: 4, eSim: ESimModel(name: 'USA', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
      TariffModel(price: 10, eSim: ESimModel(name: 'USA', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
      TariffModel(price: 15, eSim: ESimModel(name: 'USA', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.usa)),
    ]),
    PlanModel(id: 1, title: 'Europe', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Europe', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Europe', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Europe', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Europe', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'Asia', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Asia', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Asia', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Asia', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Asia', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'Latin America', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Latin America', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Latin America', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Latin America', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Latin America', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'North America', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'North America', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'North America', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'North America', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'North America', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'Africa', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Africa', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Africa', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Africa', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Africa', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'Middle Ease and North Africa', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Middle Ease and North Africa', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Middle Ease and North Africa', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Middle Ease and North Africa', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Middle Ease and North Africa', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'Oceania', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Oceania', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Oceania', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Oceania', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Oceania', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
    PlanModel(id: 1, title: 'Caribbean Islands', isLocal: false, price: 1.11, tariffs: [
      TariffModel(price: 1.5, eSim: ESimModel(name: 'Caribbean Islands', dataInGB: 3, days: 7, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 4, eSim: ESimModel(name: 'Caribbean Islands', dataInGB: 7, days: 10, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 10, eSim: ESimModel(name: 'Caribbean Islands', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
      TariffModel(price: 15, eSim: ESimModel(name: 'Caribbean Islands', dataInGB: 15, days: 30, createdAt: DateTime.now(), iconPath: AppIcons.world)),
    ]),
  ];
  
  Future<void> _onFetchPlans(_StoreEventFetchPlans event,
      Emitter<StoreState> emit) async{
    emit(
      StoreState.loading(
        planModels: state.planModels,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );
    
    ///await Future.delayed(const Duration(milliseconds: 2000));

    emit(
        StoreState.success(
        planModels: plans,
        isLocal: state.isLocal,
        text: state.text
      )
    );
  }

  onChangeSearchText(String text){
    add(_StoreEventSetText(text));
  }

  void _onSetSearchText(_StoreEventSetText event,Emitter<StoreState> emit){
    emit(
      StoreState.loading(
        planModels: state.planModels,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );

    final newPlanModels = plans.where((e) => e.title.contains(event.text)).toList();
    
    emit(StoreState.success(planModels: newPlanModels, isLocal: state.isLocal, text: event.text));
  }

  void _onChangePlansType(_StoreEventChangePlansType event,Emitter<StoreState> emit){
    emit(
      StoreState.loading(
        planModels: state.planModels,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );

    emit(StoreState.success(
      planModels: state.planModels,
      isLocal: event.isLocal,
      text: state.text,
    ));

  }

  void _onChangeCurrencyType(_StoreEventChangeCurrencyType event, Emitter<StoreState> emit){
    emit(
      StoreState.loading(
        planModels: state.planModels,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );

    emit(StoreState.success(
      planModels: state.planModels,
      isLocal: state.isLocal,
      text: state.text,
      currencyType: event.type
    ));
  }
}
