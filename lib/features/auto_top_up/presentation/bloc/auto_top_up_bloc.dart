
import 'package:esim_mob_app/core/utils/error/error_mapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esim_mob_app/features/preview_tariffs/data/models/package_model.dart';
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
      List<PackageModel> tariffs = [
        PackageModel( price: 2.49, currency: 'USD', packageIndex: 1, dataInMb: 2048, validDays: 7, ),
        PackageModel( price: 10.49, currency: 'USD', packageIndex: 1, dataInMb: 2048, validDays: 7,),
        PackageModel( price: 19.49, currency: 'USD', packageIndex: 1, dataInMb: 2048, validDays: 7,),
        PackageModel( price: 95.99, currency: 'USD', packageIndex: 1, dataInMb: 2048, validDays: 7,),
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
