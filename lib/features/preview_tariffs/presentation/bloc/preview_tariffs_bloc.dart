
import 'package:esim_mob_app/features/preview_tariffs/data/models/tariff_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preview_tariffs_event.dart';

part 'preview_tariffs_state.dart';

part 'preview_tariffs_bloc.freezed.dart';

class PreviewTariffsBloc
    extends Bloc<PreviewTariffsEvent, PreviewTariffsState> {
  PreviewTariffsBloc({required List<TariffModel> tariffs, required String country, required String iconPath, this.isFromWelcome = false})
      : _country = country,
        _iconPath = iconPath,
  _tariffs = tariffs,
        super(const PreviewTariffsState.initial()) {
    on<PreviewTariffsEvent>((event, emit) {
      event.map(fetchTariffs: (event) => _onFetchTariffs(event, emit), selectIndex: (event) => _onSelectIndex(event, emit));
    });
  }

  final String _country;
  final String _iconPath;
  final List<TariffModel> _tariffs;
  final bool isFromWelcome;

  String get country => _country;
  String get iconPath => _iconPath;


  void _onFetchTariffs(_PreviewTariffsEventFetchTariffs event, Emitter<PreviewTariffsState> emit){
    emit(
      PreviewTariffsState.loading(
        tariffs: state.tariffs,
        selectedIndex: state.selectedIndex
      )
    );

    emit(
      PreviewTariffsState.success(
        tariffs: _tariffs,
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
