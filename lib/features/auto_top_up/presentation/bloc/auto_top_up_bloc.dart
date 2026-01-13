
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:esim_mob_app/features/auto_top_up/data/models/dto/activation_top_up_dto.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/use_cases/fetch_activation_top_up_list_use_case.dart';
import 'package:esim_mob_app/features/auto_top_up/domain/use_cases/update_auto_top_up_use_case.dart';
import 'package:esim_mob_app/features/user/data/models/user_package_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auto_top_up_event.dart';

part 'auto_top_up_state.dart';

part 'auto_top_up_bloc.freezed.dart';

class AutoTopUpBloc extends Bloc<AutoTopUpEvent, AutoTopUpState> {
  AutoTopUpBloc({ required FetchActivationTopupListUseCase fetchActivationTopUpListUseCase, required UpdateActivationTopUpUseCase updateActivationTopUpUseCase ,required this.eSimId, required this.currencyCode }) : _fetchActivationTopUpListUseCase = fetchActivationTopUpListUseCase, _updateActivationTopUpUseCase = updateActivationTopUpUseCase, super(const AutoTopUpState.loading()) {
    on<AutoTopUpEvent>((event, emit) async {
      await event.map(
          fetchTariffs: (e) => _onFetchTariffs(e, emit),
          selectTariff: (e) => _onSelectTariff(e, emit),
          enableAutoTop: (e) => _onEnableAutoTopUp(e, emit),
      );
    });
  }

  final FetchActivationTopupListUseCase _fetchActivationTopUpListUseCase;
  final UpdateActivationTopUpUseCase _updateActivationTopUpUseCase;
  final int eSimId;
  final String? currencyCode;

  Future<void> _onFetchTariffs(_AutoTopUpEventFetchTariffs event, Emitter<AutoTopUpState> emit) async{
    String? message;
    try{
      emit(const AutoTopUpState.loading());
      final tariffs = await _fetchActivationTopUpListUseCase.call(eSimId);
      emit(AutoTopUpState.success(tariffs: tariffs, selectedIndex: state.selectedIndex));
    } on Object catch (error, stack) {
      print(stack);
      message = ErrorMapper.mapError(error);
      emit(AutoTopUpState.failure(message, selectedIndex: state.selectedIndex, tariffs: state.tariffs));
    }
  }

  Future<void> _onSelectTariff(_AutoTopUpEventSelectTariff event, Emitter<AutoTopUpState> emit)async {
    emit(AutoTopUpState.success(tariffs: state.tariffs, selectedIndex: event.selectedIndex));
  }

  void selectTariff(int index){
    add(_AutoTopUpEventSelectTariff(selectedIndex: index));
  }

  void onConfirmAutoTop() async{
    await _updateActivationTopUpUseCase.call(UpdateActivationParams(id: eSimId, dto: ActivationTopUpDto(packageId: state.tariffs[state.selectedIndex!].packageId, currencyCode: currencyCode ?? 'USD', enabled: true)));
  }

  Future<void> _onEnableAutoTopUp(_EnableAutoTopUp event, Emitter<AutoTopUpState> emit) async{
    try{
      emit(AutoTopUpState.loading(selectedIndex: state.selectedIndex, tariffs: state.tariffs));
      await _updateActivationTopUpUseCase.call(UpdateActivationParams(id: eSimId, dto: ActivationTopUpDto(packageId: state.tariffs[state.selectedIndex!].packageId, currencyCode: currencyCode ?? 'USD', enabled: true)));
      emit(AutoTopUpState.successAutoTopUp(tariffs: state.tariffs, selectedIndex: state.selectedIndex));
    } on Object catch(error, stack){
      print(stack);
      String message = ErrorMapper.mapError(error);
      emit(AutoTopUpState.failure(message,selectedIndex: state.selectedIndex, tariffs: state.tariffs));
    }
  }
}
