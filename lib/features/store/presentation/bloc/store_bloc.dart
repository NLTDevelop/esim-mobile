import 'package:bloc/bloc.dart';
import 'package:esim_mob_app/common/theme/app_assets.dart';
import 'package:esim_mob_app/features/store/data/models/currency_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:esim_mob_app/features/store/data/models/plan_model.dart';

part 'store_event.dart';

part 'store_state.dart';

part 'store_bloc.freezed.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(const StoreState.initial()) {
    on<StoreEvent>((event, emit) async {
      event.map(
        fetchPlans: (event) async {
          await _onFetchPlans(event, emit);
        },
        setText: (event) => _onSetSearchText(event, emit),
          changePlansType: (event) => _onChangePlansType(event, emit),
        changeCurrencyType: (event) => _onChangeCurrencyType(event, emit)
      );
    });
  }

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
    
    const List<PlanModel> plans = [
      PlanModel(id: 1, title: 'Turkey', isLocal: true, price: 1.11, iconPath: AppIcons.turkey),
      PlanModel(id: 1, title: 'Thailand', isLocal: true, price: 1.11, iconPath: AppIcons.thailand),
      PlanModel(id: 1, title: 'Indonesia', isLocal: true, price: 1.11, iconPath: AppIcons.indonesia),
      PlanModel(id: 1, title: 'Japan', isLocal: true, price: 1.11, iconPath: AppIcons.japan),
      PlanModel(id: 1, title: 'Malaysia', isLocal: true, price: 1.11, iconPath: AppIcons.malaysia),
      PlanModel(id: 1, title: 'USA', isLocal: true, price: 1.11, iconPath: AppIcons.usa),
      PlanModel(id: 1, title: 'Europe', isLocal: false, price: 1.11,),
      PlanModel(id: 1, title: 'Asia', isLocal: false, price: 1.11,),
      PlanModel(id: 1, title: 'Latin America', isLocal: false, price: 1.11,),
      PlanModel(id: 1, title: 'North America', isLocal: false, price: 1.11, ),
      PlanModel(id: 1, title: 'Africa', isLocal: false, price: 1.11,),
      PlanModel(id: 1, title: 'Middle Ease and North Africa', isLocal: false, price: 1.11,),
      PlanModel(id: 1, title: 'Oceania', isLocal: false, price: 1.11,),
      PlanModel(id: 1, title: 'Caribbean Islands', isLocal: false, price: 1.11,),
    ];

    emit(
        StoreState.success(
        planModels: plans,
        isLocal: state.isLocal,
        text: state.text
      )
    );
  }

  void _onSetSearchText(_StoreEventSetText event,Emitter<StoreState> emit){
    emit(
      StoreState.loading(
        planModels: state.planModels,
        isLocal: state.isLocal,
        text: state.text,
      ),
    );

    emit(StoreState.success(planModels: state.planModels, isLocal: state.isLocal, text: event.text));
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
